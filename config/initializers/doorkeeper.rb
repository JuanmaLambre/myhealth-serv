# frozen_string_literal: true

Doorkeeper.configure do
	orm :active_record

	resource_owner_from_credentials do |routes|
		begin
			LogInUser.new(document_number: params[:document_number], password: params[:password]).execute
		rescue MyHealthError => e
			render_failed_response e.error, e.error_message, e.status_code
		rescue ActiveRecord::RecordNotFound => e
			render_record_not_found e
		end
	end

	grant_flows %w(password)

	access_token_expires_in nil

	# If you are planning to use Doorkeeper in Rails 5 API-only application, then you might
	# want to use API mode that will skip all the views management and change the way how
	# Doorkeeper responds to a requests.
	#
	#api_only
end

require_relative "#{Rails.root}/lib/doorkeeper_create_token"