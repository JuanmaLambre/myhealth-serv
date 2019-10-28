class CreateMedicalPlans < ActiveRecord::Migration[5.2]
	def change
		create_table :medical_plans do |t|
			t.integer :number
			t.timestamps
		end

		create_table :medical_plans_specialties do |t|
			t.belongs_to :medical_plan
			t.belongs_to :specialty
		end
		add_index :medical_plans_specialties, [:medical_plan_id, :specialty_id], unique: true, name: 'index_medical_plans_specialties_on_medical_plan_and_specialty'

		remove_column :users, :medical_plan_number
		change_table :users do |t|
			t.belongs_to :medical_plan
		end

		remove_column :health_providers, :medical_plan_numbers_accepted
		create_table :health_providers_medical_plans do |t|
			t.belongs_to :health_provider
			t.belongs_to :medical_plan
		end
		add_index :health_providers_medical_plans, [:medical_plan_id, :health_provider_id], unique: true, name: 'index_providers_plans_on_medical_plan_and_health_provider'
	end
end
