class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    user_params
  end

  def account_update_params
    user_params
  end

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :password, :password_confirmation, :current_password, interests_attributes: [:id, :user_id, :category_id, :_destroy, category_attributes: [:id, :name, :_destroy]])
  end

end
