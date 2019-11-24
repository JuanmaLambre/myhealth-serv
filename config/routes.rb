Rails.application.routes.draw do
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	mount Rswag::Ui::Engine => '/api-docs'
	mount Rswag::Api::Engine => '/api-docs'
	use_doorkeeper
	devise_for :users

	resources :authorizations, only: [:index, :create, :show] do
		post 'cancel' => 'authorizations#cancel'
	end

	resource :health_providers do
		collection do
			get 'search' => 'health_providers#search'
		end
	end

	resources :specialties, only: [:index]

	resources :study_types

	resources :users do
		post 'log_out' => 'users#log_out'
	end

	post 'sign_up' => 'users#sign_up'
end
