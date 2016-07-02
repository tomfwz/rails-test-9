module ApplicationHelper
  def avatar(user)
    image_tag "http://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email.downcase)}"
  end
end
