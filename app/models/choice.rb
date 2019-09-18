# class Choise < ApplicationRecord
class Choice < ActiveRecord::Base

    belongs_to :word
    # belongs_to :word, class_name:"Word",
    #                             foreign_key: "id"
    #                             original: true

    validates :content, presence: true

end
