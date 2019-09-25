# class Word < ApplicationRecord
class Word < ActiveRecord::Base 

    belongs_to :category

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices

    has_many :answers, foreign_key: "word_id", dependent: :destroy

    has_many :lessons, through: :answers

    validates :content, presence: true

    validate :check_checkbox 

    def check_checkbox
        #select method　trueのchoice配列に入れる
        options = choices.select { |choice| choice.correct == true }
        if options.count > 1 || options.count == 0
            errors.add(:correct, "Should have one correct choice")
        end
    end

    def word_choices
        choices.find_by(correct: true).content
    end

end
