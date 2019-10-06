class AuthorizationsController < ApplicationController
	before_action :doorkeeper_authorize!

	def create
		authorization = Authorization.create(
			requester: current_user,
			provider: HealthProvider.find(params[:provider_id]),
			specialty: Specialty.find(params[:specialty_id]),
			status: Authorization.statuses[:requested]
		)
		authorization.image.attach params[:image]
		authorization.save!
		render json: authorization, status: 201
	end

	def show
		render_collection Authorization.where(requester: current_user)
	end

end
