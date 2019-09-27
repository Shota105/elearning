class WordsController < ApplicationController

    def index
        @lessons = Lesson.paginate(page: params[:page], per_page: 10)      
    end

end