class ApplicationController < ActionController::Base
	include ResponseRenderer
	include FailureResponseRenderer

	protect_from_forgery with: :exception
	skip_before_action :verify_authenticity_token

	rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found
	rescue_from ::ActiveRecord::RecordInvalid, with: :render_invalid_record
	rescue_from ::MyHealthError, with: :render_my_health_error

	def set_admin_locale
		I18n.locale = :es
	end

	private
	def render_object(object, options = {})
		render_successful_response ObjectRenderer.new(object, options).render
	end

	def render_collection(collection, options = {})
		render_successful_response CollectionRenderer.new(collection, options).render
	end

	def render_successful_response(hash)
		render_response hash: hash, status: 200
	end

	def render_my_health_error(exception)
		render_failed_response exception.error, exception.error_message, exception.status_code
	end

	def render_invalid_record(exception)
		render_failed_response 'invalid_record', exception.record.errors.messages, 422
	end

	def current_user
		User.find(doorkeeper_token[:resource_owner_id])
	end
end
