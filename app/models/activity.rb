class Activity < ApplicationRecord

    belongs_to :actionable, polymorphic: true
    belongs_to :user

end
