class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    user_params
  end

  def account_update_params
    user_params
  end

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :blurb, :password, :password_confirmation, :current_password, interests_attributes: [:id, :user_id, :tag_id, :_destroy, tag_attributes: [:id, :name, :taggings_count]])
  end

end
