module ApplicationHelper
  def avatar(user)
    image_tag "http://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email.downcase)}"
  end

  def current_user?(user)
    user == current_user
  end
end
