# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  medical_plan_number          :integer
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
#

class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :medical_plan_number, :document_number, :first_name, :last_name, 
		:phone_number, :birth_date, :medical_plan_expiration_date, :is_enabled
end
