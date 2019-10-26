require 'fcm'

class NotificationSender
	def initialize(receivers:, notification:)
		@receivers = receivers
		@notification = notification
		@notificator_service = FCM.new(Rails.application.secrets.firebase_key)
	end

	def send
		@notificator_service.send(receivers_device_tokens, notification_data)
	end

	private
	def receivers_device_tokens
		@receivers.map { |receiver| receiver.device_token }.compact
	end

	def notification_data
		{
			collapse_key: @notification.collapse_key,
			notification: @notification.information,
			data: @notification.data
		}
	end
end