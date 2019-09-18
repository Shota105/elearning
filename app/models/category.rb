# class Category < ApplicationRecord
class Category < ActiveRecord::Base

    validates :title, presence: true
    validates :description, presence: true
    
    has_many :words, foreign_key: "category_id", dependent: :destroy
    accepts_nested_attributes_for :words


end
