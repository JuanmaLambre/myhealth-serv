class UsersController < ApplicationController
	#skip_before_action :doorkeeper_authorize!

	def sign_up
		render_object SignUpUser.new(user_params: user_params).execute
	end

	private
	def user_params
		params.permit(:email, :medical_plan_number, :document_number, :first_name, :last_name, 
			:phone_number, :birth_date, :medical_plan_expiration_date, :password
		)
	end
end
