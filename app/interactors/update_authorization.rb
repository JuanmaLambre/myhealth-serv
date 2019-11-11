class UpdateAuthorization < BaseInteractor
	def initialize(authorization_params:, current_user:)
		@authorization_params = authorization_params
		@current_user = current_user
	end

	def execute
		update_authorization
		send_notification
		authorization
	end

	private
	def update_authorization
		authorization.update! authorization_attributes
		authorization.overlay_admin_signature(@current_user.signature)
		authorization.reload
	end

	def authorization_attributes
		attributes = update_params.permit(:comment, :image, :status)
		attributes = attributes.merge({processed_time: Time.current, authorizer: @current_user}) if status_has_changed?
		attributes
	end

	def send_notification
		NotificationSender.new(receivers: [authorization.requester], notification: notification).send
	end

	def notification
		@notification ||= AuthorizationNotification.new(authorization: authorization)
	end

	def authorization
		@authorization ||= Authorization.find(@authorization_params[:id])
	end

	def update_params
		@authorization_params[:authorization]
	end

	def new_status
		update_params[:status]
	end

	def status_has_changed?
		new_status.present? && Authorization.statuses[authorization.status] != new_status
	end
end
