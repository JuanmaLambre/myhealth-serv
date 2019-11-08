# == Schema Information
#
# Table name: medical_plans_specialties
#
#  id              :bigint           not null, primary key
#  medical_plan_id :bigint
#  specialty_id    :bigint
#

class MedicalPlansStudyTypes < ApplicationRecord
	validates :medical_plan, uniqueness: { scope: :tudy_type }

	belongs_to :study_type
	belongs_to :medical_plan
end
