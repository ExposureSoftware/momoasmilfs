require 'net/https'
require 'json'

namespace :background do
  desc "Background tasks for the application."
  task fetch_image: :environment do
    puts 'Fetching new daily image...'
    request = Net::HTTP.new('www.googleapis.com', 443)
    request.use_ssl = true
    response = request.request_get("/customsearch/v1?q=jason+momoa&cx=012271736568226121945%3At7csljwkpuy&searchType=image&key=#{ENV['GOOGLE_API_KEY']}")
    selected = JSON.parse(response.body)['items'].sample

    image = Image.new
    image.contextUrl = selected['image']['contextLink']
    image.htmlTitle = selected['htmlTitle']
    image.title = selected['title']
    image.url = selected['link']
    image.save
    puts image

    thumbnail = image.create_thumbnail
    thumbnail.url = selected['image']['thumbnailLink']
    thumbnail.height = selected['image']['thumbnailHeight']
    thumbnail.width = selected['image']['thumbnailWidth']
    thumbnail.save

    puts "Saved image #{image.id} titled '#{image.title}'."
  end

end
