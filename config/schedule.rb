# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :chronic_options, hours24: true
set :output, "/var/www/momoasmilfs.club/log/whenever.log"

job_type :rake, %Q{export PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output}

every :day, at: '2:00' do
  rake "background:fetch_image"
end

every :day, at: '10:00' do
  rake "background:mail_image"
end