class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = "Logged In!"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid credentials."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logged Out!"
    redirect_to root_path
  end

end
