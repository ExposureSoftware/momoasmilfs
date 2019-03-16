class MembersController < ApplicationController
  def new

  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params.require(:member).permit(:email))

    respond_to do |format|
      if @member.save
        # TODO Change to deliver_now as per https://guides.rubyonrails.org/action_mailer_basics.html
        UserMailer.with(user: @member).verification_email.deliver_later
        format.html { redirect_to @member, notice: 'Member added.'}
        format.js {}
        format.json { render json: @member.errors, status: :unprecessable_entity }
      else
        form.html { render :new }
        format.json { render json: @member.errors, status: :unprecessable_entity }
      end
    end
  end

  def index
    @members = Member.all
  end
end
