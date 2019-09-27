
# module Categories
    class LessonsController < ApplicationController

        def index
            @lessons = Lesson.paginate(page: params[:page], per_page: 10)
            
        end

        def show
            @lesson = Lesson.find(params[:id])
            @lessons = @lesson.answers.all
            @corrects = @lesson.choices.where(correct: true).count
        end

        def create
            category = Category.find(params[:category_id])
            lesson = category.lessons.build(user_id: current_user.id)
            
            if lesson.save

                redirect_to new_lesson_answer_path(lesson)
            end
        end 

    end

# end