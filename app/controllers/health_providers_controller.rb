class HealthProvidersController < ApplicationController
	before_action :doorkeeper_authorize!

	def search
		health_providers = HealthProvider.where(specialty_id: params[:specialty_id])
			.includes(:medical_plans_accepted).references(:medical_plans_accepted)
			.where(medical_plans: { id: current_user.medical_plan.id } )
			.within(params[:radius], :origin => [params[:latitude], params[:longitude]])
		render_collection health_providers
	end
end
