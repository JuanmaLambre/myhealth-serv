class FamilyGroupSerializer < ActiveModel::Serializer
	has_many :users
end