# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def button_form_for(name, *args, &block)
    options = args.extract_options!
    form_for(name, *(args << options.merge(builder: buttonFormBuilder)), &block)
  end

  def user_avatar(user, size = 150)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.username, size: size)
    end
  end
end
