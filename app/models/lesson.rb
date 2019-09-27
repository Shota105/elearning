class Lesson < ActiveRecord::Base

    belongs_to :user
    belongs_to :category

    has_many :answers, foreign_key: "lesson_id", dependent: :destroy
    accepts_nested_attributes_for :answers

    has_many :words, through: :answers
    has_many :choices, through: :answers

    has_one :activity, as: :actionable, dependent: :destroy

end
