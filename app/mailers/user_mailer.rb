class UserMailer < ApplicationMailer
  default from: 'notifications@momoasmilfs.club'

  def verification_email
    @user = params[:user]
    @url  = "https://momoasmilfs.club/verify/#{@user.id}"
    mail(to: @user.email, subject: 'Verify Your Email', from: 'verify@momoasmilfs.club')
  end
end
