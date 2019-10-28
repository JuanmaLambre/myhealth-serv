class CreateAuthorization
	def initialize(requester:, provider_id:, specialty_id:, requester_image:)
		@requester = requester
		@provider_id = provider_id
		@specialty_id = specialty_id
		@requester_image = requester_image
	end

	def execute
		create_authorization
		@authorization
	end

	private
	def create_authorization
		@authorization = Authorization.create!(requester: @requester, provider: provider, 
			specialty: specialty, status: status
		)
		attach_image
	end

	def attach_image
		@authorization.requester_image.attach @requester_image
	end

	def provider
		@provider ||= HealthProvider.find @provider_id
	end

	def specialty
		@specialty ||= Specialty.find @specialty_id
	end

	def status
		return :accepted if @requester.medical_plan.autmatically_accepted_specialties.include?(specialty)
		:requested
	end
end