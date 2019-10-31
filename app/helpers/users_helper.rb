# frozen_string_literal: true

# :nodoc:
module UsersHelper
  def profile_img_for(user)
    image_tage user_avatar(user)
  end

  def friend_requests
    pending_inverse_friendships.map(&:user)
  end
end
