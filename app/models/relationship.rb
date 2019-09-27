class Relationship < ApplicationRecord

    has_one :activity, as: :actionable, dependent: :destroy

    belongs_to :follower, class_name:"User"
    belongs_to :followed, class_name:"User"

    validates :follower_id, presence: true
    validates :followed_id, presence: true

end