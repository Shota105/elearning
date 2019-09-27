class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 12)
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
    @user = User.find(params[:id])

    @activity = current_user.activities.build
    @activities = @user.feed.limit(5).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "succesfully Update!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page],per_page: 12)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 12)
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end

  def require_login
    unless logged_in?
      flash[:info] = "Please log in!"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "User not authorized"
      redirect_to root_path
    end
  end

end
