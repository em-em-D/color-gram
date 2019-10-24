# frozen_string_literal: true

# :nodoc:
module UsersHelper
  def profile_img_for(user)
    image_tage user_avatar(user)
  end
end
