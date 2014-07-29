class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:email, :username, :avatar, :password, :password_confirmation, interests_attributes: [:id, :user_id, :category_id, :_destroy, category_attributes: [:id, :name]])
    end

end
