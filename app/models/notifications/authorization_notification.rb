class AuthorizationNotification
	def initialize(authorization:)
		@authorization = authorization
	end

	def collapse_key
		'authorization'
	end

	def information
		{ title: title, body: body, content_available: true, priority: 'high' }
	end

	def data
		information
	end

	private
	def title
		"#{requester_name} hay una notificación para vos"
	end

	def body
		"La autorización para #{specialty_name} fue #{authorization_status_description}"
	end

	def requester_name
		@authorization.requester.name
	end

	def specialty_name
		@authorization.specialty.name
	end

	def authorization_status_description
		status_description[@authorization.status.to_sym]
	end

	def status_description
		{
			evaluation: 'evaluada',
			declined: 'rechazada',
			accepted: 'aceptada'
		}
	end
end