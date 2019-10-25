# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  document_number              :integer
#  first_name                   :string(255)
#  last_name                    :string(255)
#  phone_number                 :string(255)
#  birth_date                   :date
#  medical_plan_expiration_date :date
#  is_enabled                   :boolean          default(TRUE), not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  device_token                 :string(255)
#  medical_plan_id              :bigint
#

FactoryBot.define do
	factory :user do
		document_number { 11111111 }
		medical_plan_number { 310 }
	end
end
