class UserMailer < ApplicationMailer
  default from: 'notifications@momoasmilfs.club'

  def verification
    @user = params[:user]
    @url  = "https://momoasmilfs.club/verify/#{@user.id}"
    mail(to: @user.email, subject: 'Verify Your Email', from: 'verify@momoasmilfs.club')
  end

  def daily_image
    @user = params[:user]
    @image = Image.order('created_at').last
    mail(to: @user.email, subject: 'Daily Momoa Image', from: 'images@momoasmilfs.club')
  end
end
