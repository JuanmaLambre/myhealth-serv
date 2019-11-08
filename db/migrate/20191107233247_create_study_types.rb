class CreateStudyTypes < ActiveRecord::Migration[5.2]
	def change
		create_table :study_types do |t|
			t.string :name
			t.datetime :deleted_at
			t.timestamps
		end

		change_table :authorizations do |t|
			t.belongs_to :study_type
		end

		remove_index :medical_plans_specialties, name: 'index_medical_plans_specialties_on_medical_plan_and_specialty'
		drop_table :medical_plans_specialties

		create_table :medical_plans_study_types do |t|
			t.belongs_to :medical_plan
			t.belongs_to :study_type
		end
		add_index :medical_plans_study_types, [:medical_plan_id, :study_type_id], unique: true, name: 'index_medical_plans_studies_on_medical_plan_and_studies'
	end
end
