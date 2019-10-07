class Authorization < ApplicationRecord
	include Rails.application.routes.url_helpers

	enum status: { requested: 'Pedido', evaluation: 'En evaluación', declined: 'Rechazado', accepted: 'Aceptado' }

	belongs_to :requester, class_name: 'User'
	belongs_to :specialty
	belongs_to :provider, class_name: 'HealthProvider'
	belongs_to :authorizer, class_name: 'AdminUser', optional: true

	has_one_attached :requester_image
	has_one_attached :image

	scope :requester_email, -> (email) { joins(:requester).where('users.email': email) }


	def requester_image_url
		return nil unless requester_image.attached?
		url_for requester_image
	end

	def approver_image_url
		return nil unless image.attached?
		url_for image
	end
end
