# == Schema Information
#
# Table name: medical_plans
#
#  id         :bigint           not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MedicalPlan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
