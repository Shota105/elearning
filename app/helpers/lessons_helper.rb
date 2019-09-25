module LessonsHelper

    def lesson(category)
        Lesson.find_by(user_id: current_user.id, category_id: category.id)
    end

end