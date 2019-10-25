class AuthorizationsController < ApplicationController
	before_action :doorkeeper_authorize!

	def create
		authorization = Authorization.create!(
			requester: current_user,
			provider: HealthProvider.find(params[:provider_id]),
			specialty: Specialty.find(params[:specialty_id]),
			status: :requested
		)
		authorization.requester_image.attach params[:requester_image]
		render_object authorization
	end

	def index
		render_collection Authorization.where(requester: current_user)
	end
end
