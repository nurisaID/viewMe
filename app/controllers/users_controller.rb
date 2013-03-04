class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
	flash[:notice] = "You Signed now"
	else
	flash[:notice] = "Data invalid"
	render "new"
	end
  end

  def show
  end
end
