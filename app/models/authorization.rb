# == Schema Information
#
# Table name: authorizations
#
#  id             :bigint           not null, primary key
#  requester_id   :bigint
#  provider_id    :bigint
#  specialty_id   :bigint
#  status         :string(255)
#  processed_time :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comment        :text(65535)
#  authorizer_id  :bigint
#

class Authorization < ApplicationRecord
	include Rails.application.routes.url_helpers

	enum status: AuthorizationStatus.values

	belongs_to :requester, class_name: 'User'
	belongs_to :specialty
	belongs_to :study_type
	belongs_to :provider, class_name: 'HealthProvider'
	belongs_to :authorizer, class_name: 'AdminUser', optional: true

	has_one_attached :requester_image
	has_one_attached :image

	validates :requester_image, size: { less_than: 50.megabytes , message: 'La imagen pesa más de lo permitido' }

	scope :requester_email, -> (email) { joins(:requester).where('users.email': email) }


	def requester_image_url
		return nil unless requester_image.attached?
		url_for requester_image
	end

	def approver_image_url
		return nil unless image.attached?
		url_for image
	end

	def overlay_admin_signature(signature)
		image_list = Magick::ImageList.new()
		image_list.push Magick::Image.from_blob(requester_image.download).first if requester_image.attached?
		image_list.push Magick::Image.from_blob(signature.download).first

		random_name = (0...16).map { (65 + rand(26)).chr }.join + '.jpg'
		image_list.append(true).write(random_name)
		requester_image.attach(io: File.open(random_name), filename: random_name)
		File.delete(random_name)
	end
end
