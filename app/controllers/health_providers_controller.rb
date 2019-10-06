class HealthProvidersController < ApplicationController
	before_action :doorkeeper_authorize!

	def search
		health_providers = HealthProvider.where(specialty_id: params[:specialty_id])
			.within(params[:radius], :origin => [params[:latitude], params[:longitude]])
		render_collection health_providers
	end
end
