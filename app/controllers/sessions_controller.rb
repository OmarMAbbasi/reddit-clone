class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:password],
      params[:user][:username]
    )
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to subs_url
  end
end
