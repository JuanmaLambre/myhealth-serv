require 'securerandom'

class UsersController < ApplicationController
	before_action :doorkeeper_authorize!, except: [:sign_up, :reset_password]

	def log_out
		current_user.update! device_token: nil
		render_object current_user
	end

	def show
		render_object current_user, { include: [ :medical_plan, family_group: :users ] }
	end

	def sign_up
		render_object SignUpUser.new(user_params: user_params).execute
	end

	def update
		current_user.update! device_token: params[:device_token]
		render_object current_user.reload
	end

	def reset_password
		user = User.find_by(email: params[:email])
		if (user.present?)
			password = SecureRandom.urlsafe_base64(8)
			user.update!(password: password)
			ResetPasswordMailer.send_reset_password_mail(password, params[:email])
		end
		render_successful_response(message: "Successful")
	end

	private
	def user_params
		params.permit(:email, :medical_plan_number, :document_number, :first_name, :last_name, 
			:phone_number, :birth_date, :medical_plan_expiration_date, :password
		)
	end
end
