class StaticPagesController < ApplicationController
  def home
    # @user = User.find(current_user.id)
    if logged_in?
      render 'users/home_feed'
    end
  end

  def about
  end
end
