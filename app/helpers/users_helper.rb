module UsersHelper
    # def gravatar_for(user, options = {size: 80} )
    #     #generate hex token
    #     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #     image_size = options[:size]
    #     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{image_size}"
    #     # create image element
    #     image_tag(gravatar_url, alt: user.name)
    # end

    # def admin
    #     User.find(params[:admin])
    # end

    def followed_user
        User.find_by(user_id: current_user.id, followed_id: activity.id)
    end

end
