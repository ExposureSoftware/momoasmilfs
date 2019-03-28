class MembersController < ApplicationController
  def new

  end

  def show

  end

  def create
    @member = Member.new(params.require(:member).permit(:email))

    respond_to do |format|
      if @member.save
        UserMailer.with(user: @member).verification.deliver_now
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
    @members = Member.where('verified').count
  end
end
