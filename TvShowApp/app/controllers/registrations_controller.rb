class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :birthday, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :first_name, :last_name, :about, :birthday, :email, :password, :password_confirmation, :current_password)
  end
end
