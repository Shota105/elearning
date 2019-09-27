class StaticPagesController < ApplicationController
  def home
    if logged_in?

      @activity = current_user.activities.build
      @activities = current_user.feed.limit(5).order(created_at: :desc)
      
      render 'users/home_feed'
    end
  end

  def about
  end

end
