# == Schema Information
#
# Table name: health_providers
#
#  id            :bigint           not null, primary key
#  phone_number  :string(255)
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  specialty_id  :bigint
#  provider_type :string(255)
#  languages     :text(65535)
#  latitude      :decimal(13, 10)
#  longitude     :decimal(13, 10)
#  address       :text(65535)
#

class HealthProvider < ApplicationRecord
	enum provider_type: { doctor: 'doctor', hospital: 'hospital' }

	belongs_to :specialty

	has_and_belongs_to_many :medical_plans_accepted, class_name: 'MedicalPlan'

	acts_as_mappable :default_units => :kms,
		:lat_column_name => :latitude,
		:lng_column_name => :longitude
end
