class AuthorizationSerializer < ActiveModel::Serializer
	attributes :id, :requester_id, :provider_id, :specialty_id, :status, :processed_time

	has_one :requester_image_url
	has_one :approver_image_url
end