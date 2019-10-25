class HealthProviderSerializer < ActiveModel::Serializer
	attributes :id, :phone_number, :name, :provider_type, :languages, :latitude,
		:longitude, :address
end
