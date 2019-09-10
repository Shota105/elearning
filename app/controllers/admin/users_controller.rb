module Admin

    class UsersController < ApplicationController
    
        def index
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

    end
    
end