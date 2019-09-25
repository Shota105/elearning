module CategoriesHelper

    def category_id
        Category.find_by(params[:id])
    end

end
