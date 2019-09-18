# class Word < ApplicationRecord
class Word < ActiveRecord::Base 

    belongs_to :category

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices

    validates :content, presence: true

end
