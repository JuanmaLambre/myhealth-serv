# == Schema Information
#
# Table name: medical_plans_specialties
#
#  id              :bigint           not null, primary key
#  medical_plan_id :bigint
#  specialty_id    :bigint
#

class MedicalPlansSpecialties < ApplicationRecord
	validates :medical_plan, uniqueness: { scope: :specialty }

	belongs_to :medical_plan
	belongs_to :specialty
end
