# == Schema Information
#
# Table name: health_providers_medical_plans
#
#  id                 :bigint           not null, primary key
#  health_provider_id :bigint
#  medical_plan_id    :bigint
#

class HealthProvidersMedicalPlans < ApplicationRecord
	validates :medical_plan, uniqueness: { scope: :health_providers }

	belongs_to :medical_plan
	belongs_to :health_provider
end
