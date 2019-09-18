module Admin
    class WordsController < ApplicationController

        before_action :admin_check, except: [:new, :create]

        def index
            @category = Category.find(params[:category_id])
            @words = @category.words.all
        end

        def new
            @category = Category.find(params[:category_id])
            @word = @category.words.build
            3.times { @word.choices.build }
        end

        def create
            @category = Category.find(params[:category_id])
            @word = @category.words.build(word_params)
            if @word.save
                flash[:success] = "Succesfully Created"
                redirect_to admin_categories_path
            else
                render "new"
            end
        end

        def show
            @word = Word.find(params[:id])
        end

        def edit
            @category = Category.find(params[:category_id])
            @word = Word.find(params[:id])
        end

        def update
            @word = Word.find(params[:id])

            if @word.update_attributes(word_params)
                flash[:success] = "Succesfully Update"
                redirect_to admin_category_words_path
            else
                render 'edit'
            end
        end

        def destroy
            @category = Category.find(params[:category_id])
            @word = Word.find(params[:id])
            @word.destroy

            flash[:success] = "Deleted"
            redirect_to admin_category_words_path
        end

        private
        def word_params
            params.require(:word).permit(:content, choices_attributes: [:id, :content, :word_id, :correct])
        end
        
        def admin_check
            unless @user.try(:admin) || current_user.try(:admin)
                flash[:danger] = "You are not admin!"
                redirect_to root_path
            end
        end

    end
end
