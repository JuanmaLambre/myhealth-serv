class RenameDoctorByHealthProvider < ActiveRecord::Migration[5.2]
	def change
		rename_table :doctors, :health_providers
		add_column :health_providers, :provider_type, :string
		add_column :health_providers, :languages, :text
		add_column :health_providers, :medical_plan_numbers_accepted, :text
		add_column :health_providers, :latitude, :decimal, :precision => 13, :scale => 10 
		add_column :health_providers, :longitude, :decimal, :precision => 13, :scale => 10 
		add_column :health_providers, :address, :text

		remove_column :health_providers, :hospital_id
		drop_table :hospitals
	end
end
