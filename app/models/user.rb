class User < ApplicationRecord

    include Gravtastic
    gravtastic

    mount_uploader :image, ImageUploader

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, presence: true,
                                length: { minimum: 8}, allow_nil: true

    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship",
                                     foreign_key: "followed_id",
                                     dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    has_many :lessons, foreign_key: "user_id", dependent: :destroy
    has_many :categories, through: :lessons

    has_many :activities

    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        # following.delete(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
        following.include?(other_user)
    end

    def feed
        following_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
        followed_ids = "SELECT follower_id FROM relationships
                         WHERE followed_id = :user_id"                  
        Activity.where("user_id IN (#{following_ids})
                        OR user_id = :user_id", user_id: id)
        Activity.where("user_id IN (#{followed_ids})
                        OR user_id = :user_id", user_id: id)                
    end

end