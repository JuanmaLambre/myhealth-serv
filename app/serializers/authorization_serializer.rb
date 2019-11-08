class AuthorizationSerializer < ActiveModel::Serializer
	attributes :id, :status, :processed_time

	belongs_to :requester
	belongs_to :provider
	belongs_to :specialty
	belongs_to :study_type

	has_one :requester_image_url
	has_one :approver_image_url
end
