module ApplicationHelper
    def find_user_profile_image(user, options = { size: 80})
        email_address = user.email
        size = options[:size]
        hash = Digest::MD5.hexdigest(email_address)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "rounded shadow mx-auto d-block")
    end
end
