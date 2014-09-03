class RegistrationsController < ApplicationController

  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

end