module Admin

    class UsersController < ApplicationController
    
        before_action :admin_check, except: [:new, :create]

        def index
            # @user = User.find(params[:id])
            @users = User.paginate(page: params[:page], per_page: 10)
        end

        def destroy
            user = User.find(params[:id])
            user.destroy

            flash[:success] = "Deleted"
            redirect_to admin_users_path
        end

        def update
            user = User.find(params[:id])
            user.update_attributes(user_params)

            redirect_to admin_users_path
        end
    
        private
        def user_params
            params.require(:user).permit(:admin)
        end

        def admin_check
            unless @user.try(:admin) or current_user.try(:admin)
                flash[:danger] = "You are not admin!"
                redirect_to root_path
            end
        end

    end
    
end