class SessionController < ApplicationController
  def new
  end


  def create
    user = User.authenticate(params[:user][:login], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/studies/', :notice => "Logged in!"
    else
      flash.now.alert = "Invalid login name or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/studies/', :notice => "Logged out!"
  end

end
