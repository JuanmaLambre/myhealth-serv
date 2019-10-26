class UsersController < ApplicationController
	before_action :doorkeeper_authorize!, only: [:update]

	def sign_up
		render_object SignUpUser.new(user_params: user_params).execute
	end

	def update
		current_user.update! device_token: params[:device_token]
		render_object current_user.reload
	end

	private
	def user_params
		params.permit(:email, :medical_plan_number, :document_number, :first_name, :last_name, 
			:phone_number, :birth_date, :medical_plan_expiration_date, :password
		)
	end
end
