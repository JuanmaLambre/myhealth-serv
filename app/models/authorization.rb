class Authorization < ApplicationRecord
	include Rails.application.routes.url_helpers

	enum status: { requested: 'Requested', evaluation: 'Evaluation', declined: 'Declined', accepted: 'Accepted' }

	belongs_to :requester, class_name: 'User'
	belongs_to :specialty
	belongs_to :provider, class_name: 'HealthProvider'

	has_one_attached :requester_image
	has_one_attached :image

	def requester_image_url
		return nil unless requester_image.attached?
		url_for requester_image
	end

	def approver_image_url
		return nil unless image.attached?
		url_for image
	end
end
