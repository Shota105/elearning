class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def login
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Succesfully registered!"
      redirect_to login_path
    else
      render "new"
    end
    

  end

  def show
    
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password_confirmation)
  end

end
