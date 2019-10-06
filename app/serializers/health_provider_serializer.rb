class HealthProviderSerializer < ActiveModel::Serializer
	attributes :id, :phone_number, :name, :provider_type, :languages, :medical_plan_numbers_accepted, :latitude,
		:longitude, :address
end