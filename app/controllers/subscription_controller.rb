class SignUpController < ApplicationController
  def unsubscribe
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.unverify
        format.html {render 'success'}
      else
        format.html {render 'failure'}
      end
    end
  end
end