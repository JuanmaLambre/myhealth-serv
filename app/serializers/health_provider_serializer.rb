# == Schema Information
#
# Table name: health_providers
#
#  id                            :bigint           not null, primary key
#  phone_number                  :string(255)
#  name                          :string(255)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  specialty_id                  :bigint
#  provider_type                 :string(255)
#  languages                     :text(65535)
#  medical_plan_numbers_accepted :text(65535)
#  latitude                      :decimal(13, 10)
#  longitude                     :decimal(13, 10)
#  address                       :text(65535)
#

class HealthProviderSerializer < ActiveModel::Serializer
	attributes :id, :phone_number, :name, :provider_type, :languages, :medical_plan_numbers_accepted, :latitude,
		:longitude, :address
end
