require 'swagger_helper'

describe 'Health Provider API' do
	path '/health_providers/search' do
		get 'Search health providers' do
			tags 'HealthProvider'
			consumes 'application/json'
			parameter name: :specialty, in: :path, type: :string, required: true, description: 'oculista o traumatologo'
			parameter name: :radius, in: :path, type: :integer, required: true, description: 'radio en km'
			parameter name: :latitude, in: :path, type: :float, required: true
			parameter name: :longitude, in: :path, type: :float, required: true
			parameter in: :header, type: :string, name: :authorization, required: true, description: 'Client token'
			let!(:user) { create :user }
			let!(:token) { Doorkeeper::AccessToken.create! :resource_owner_id => user.id }
			let(:authorization) { "Bearer #{token.token}" }
			let(:specialty) { 'traumatologo' }
			let(:radius) { 10 }
			let(:latitude) { -34.5651435 }
			let(:longitude) { -58.4232236 }

			response '200', 'health providers searched' do
				run_test!
			end
		end
	end
end