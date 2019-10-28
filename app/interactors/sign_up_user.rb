class SignUpUser < BaseInteractor
	def initialize(user_params:)
		@user_params = user_params
	end

	def execute
		validate_user
		update_user
		user
	end

	private
	def user
		@user ||= User.find_by!(document_number: @user_params[:document_number], medical_plan: medical_plan)
	end

	def medical_plan
		@medical_plan ||= MedicalPlan.find_by! @user_params[:medical_plan_number]
	end

	def update_user
		user.update! user_attributes
	end

	def user_attributes
		@user_params.slice(:email, :first_name, :last_name, :phone_number, :birth_date, 
			:medical_plan_expiration_date, :password
		)
	end

	def validate_user
		invalid :user, 'El usuario ya se encuentra registrado' if user.encrypted_password.present?
	end
end