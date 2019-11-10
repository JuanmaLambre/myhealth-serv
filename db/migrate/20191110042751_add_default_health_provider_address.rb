class AddDefaultHealthProviderAddress < ActiveRecord::Migration[5.2]
	def change
		change_column :health_providers, :latitude, :decimal, :precision => 13, :scale => 10, default: -34.6175724
		change_column :health_providers, :longitude, :decimal, :precision => 13, :scale => 10, default: -58.3694685
		change_column :health_providers, :address, :string, default: 'Av. Paseo Colón 802'
	end
end
