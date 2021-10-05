module ApplicationHelper

    def gravatar_for(user, options ={size: 100})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.user_name, class: " shadow rounded mx-auto d-block")
    end

end
