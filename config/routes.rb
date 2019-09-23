Rails.application.routes.draw do
	mount Rswag::Ui::Engine => '/api-docs'
	mount Rswag::Api::Engine => '/api-docs'
	use_doorkeeper
	devise_for :users

	resource :doctors do
		collection do
			get 'search' => 'doctors#search'
		end
	end

	post 'sign_up' => 'users#sign_up'

    resource :specialties, only: [:show]

end
