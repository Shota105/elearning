
    class AnswersController < ApplicationController
    
        def new
            @lesson = Lesson.find(params[:lesson_id])
            @words = (@lesson.category.words - @lesson.words)
            
            if @words.first.nil?
                @choices = @lesson.answers.all               
                
                @corrects = @lesson.choices.where(correct: true).count
                @lesson.update(result: @corrects)
                                    
                redirect_to lesson_path(@lesson)
            else
                @answer = @lesson.answers.build
            end
        end

        def create
            @lesson = Lesson.find(params[:lesson_id])
            @answer = @lesson.answers.build(answer_params)
            
            if @answer.save
    
                redirect_to new_lesson_answer_path
            end
        end

        private
        def answer_params
            params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
        end
    
    end