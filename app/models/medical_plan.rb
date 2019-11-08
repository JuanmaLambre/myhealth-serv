# == Schema Information
#
# Table name: medical_plans
#
#  id         :bigint           not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MedicalPlan < ApplicationRecord
	has_and_belongs_to_many :autmatically_accepted_studies, class_name: 'StudyType'

	def display_name
		number
	end
end
