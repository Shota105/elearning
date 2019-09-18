module Admin

    class CategoriesController < ApplicationController
        
        before_action :admin_check, except: [:new, :create]

        def index
            @categories = Category.paginate(page: params[:page], per_page: 7)
        end

        def new
            @category = Category.new
        end

        def create
            @category = Category.new(category_params)

            if @category.save
                flash[:success] = "Succesfully Created"
                redirect_to admin_categories_path
            else
                render "new"
            end
        end

        def show
            @category = Category.find(params[:id])
        end

        def edit
            @category = Category.find(params[:id])
        end

        def update
            @category = Category.find(params[:id])

            if @category.update_attributes(category_params)
                flash[:success] = "Succesfully Update"
                redirect_to admin_categories_path
            else
                render 'edit'
            end
        end

        def destroy
            @category = Category.find(params[:id])
            @category.destroy

            flash[:success] = "Deleted"
            redirect_to admin_categories_path
        end

        private
        def category_params
            params.require(:category).permit(:title, :description)
        end

        def admin_check
            unless @user.try(:admin) || current_user.try(:admin)
                flash[:danger] = "You are not admin!"
                redirect_to root_path
            end
        end

    end

end