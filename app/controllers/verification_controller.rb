class VerificationController < ApplicationController
  def verify
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.verify
        format.html {render 'success'}
      else
        format.html {render 'failure'}
      end
    end
  end
end
