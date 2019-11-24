class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :document_number, :first_name, :last_name, 
		:phone_number, :birth_date, :medical_plan_expiration_date, :is_enabled

	belongs_to :medical_plan
	belongs_to :family_group
end
