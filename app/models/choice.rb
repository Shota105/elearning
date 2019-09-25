# class Choise < ApplicationRecord
class Choice < ActiveRecord::Base

    belongs_to :word
    
    has_many :answers, dependent: :destroy

    has_many :lessons, through: :answers

    validates :content, presence: true

end
