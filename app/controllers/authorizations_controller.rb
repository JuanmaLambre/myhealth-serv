class AuthorizationsController < ApplicationController
	before_action :doorkeeper_authorize!

	def cancel
		authorization = Authorization.find(params[:authorization_id])
		authorization.cancel!
		render_object authorization
	end

	def create
		authorization = CreateAuthorization.new(requester: current_user, provider_id: params[:provider_id], 
			specialty_id: params[:specialty_id], study_type_id: params[:study_type_id], 
			requester_image: params[:requester_image]
		).execute
		render_object authorization
	end

	def index
		render_collection Authorization.where(requester: current_user)
	end

	def show
		render_object Authorization.find params[:id]
	end
end
