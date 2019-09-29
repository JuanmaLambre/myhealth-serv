require 'swagger_helper'

describe 'Users API' do
	path '/sign_up' do
		post 'Sign up' do
			tags 'Users'
			consumes 'application/json'
			parameter name: :user_params, in: :body, schema: {
				type: :object,
				properties: {
					document_number: { type: :integer },
					medical_plan_number: { type: :integer },
					email: { type: :string },
					first_name: { type: :string },
					last_name: { type: :string },
					phone_number: { type: :string },
					birth_date: { type: :string },
					medical_plan_expiration_date: { type: :string },
					password: { type: :string }
				},
				required: [ 'document_number', 'medical_plan_number' ]
			}
			let(:user_params) { { document_number: 11111111, medical_plan_number: 310 } }

			response '200', 'user signed up' do
				run_test!
			end

			response '422', 'invalid email' do
				let(:user_params) { { document_number: 11111111, medical_plan_number: 310, email: 'email' } }
				run_test!
			end

			response '400', 'user has already signed up' do
				before { User.find_by!(user_params).update! password: 'password' }
				run_test!
			end

			response '404', 'user doesn\'t exist' do
				let(:user_params) { { document_number: 1, medical_plan_number: 310 } }
				run_test!
			end
		end
	end

	path '/oauth/token' do
		post 'Log in' do
			tags 'Users'
			consumes 'application/json'
			parameter name: :log_in_params, in: :body, schema: {
			type: :object,
			properties: {
				document_number: { type: :integer },
				password: { type: :string },
				grant_type: { type: :string, description: 'password' }
			},
			required: [ 'document_number', 'password', 'grant_type' ]
			}
			let(:password) { 'test' }
			let(:log_in_params) { { document_number: 12, password: password, grant_type: 'password' } }

			response '200', 'user logged in' do
				let!(:user) { create :user, document_number: 12, password: password }
				run_test!
			end

			response '400', 'invalid password' do
				let!(:user) { create :user, document_number: 12, password: 'another_pass' }
				run_test!
			end

			response '404', 'user doesn\'t exist' do
				run_test!
			end
		end
	end
end