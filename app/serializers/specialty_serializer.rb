# == Schema Information
#
# Table name: specialties
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpecialtySerializer < ActiveModel::Serializer
	attributes :id, :name
end
