# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = User.find_by(mobile_number: params[:user][:mobile_number])
    if resource&.valid_password?(params[:user][:password])
      if params[:user][:otp] == "1234" # Default OTP
        sign_in(resource_name, resource)
        redirect_to root_path, notice: "Login successful!"
      else
        redirect_to new_user_session_path, alert: "Invalid OTP"
      end
    else
      redirect_to new_user_session_path, alert: "Invalid mobile number or password"
    end
  end
end
