class CreateAuthorization
	def initialize(requester_id:, provider_id:, specialty_id:, study_type_id:, requester_image:)
		@requester_id = requester_id
		@provider_id = provider_id
		@specialty_id = specialty_id
		@study_type_id = study_type_id
		@requester_image = requester_image
	end

	def execute
		create_authorization
		@authorization
	end

	private
	def create_authorization
		@authorization = Authorization.create!(requester: requester, provider: provider, 
			specialty: specialty, status: status, study_type: study_type, automated: is_automated?
		)
		attach_image
	end

	def attach_image
		@authorization.requester_image.attach @requester_image
	end

	def requester
		@requester ||= User.find @requester_id
	end

	def provider
		@provider ||= HealthProvider.find @provider_id
	end

	def specialty
		@specialty ||= Specialty.find @specialty_id
	end

	def study_type
		@study_type ||= StudyType.find @study_type_id
	end

	def status
		return :accepted if is_automated?
		:requested
	end

    def is_automated?
        return @requester.medical_plan.autmatically_accepted_studies.include?(study_type)
    end
end
