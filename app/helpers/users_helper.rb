module UsersHelper
  def determine_confirm_path(user)
    if user.new_record?
      confirm_create_users_path
    else
      confirm_update_user_path
    end
  end
end
