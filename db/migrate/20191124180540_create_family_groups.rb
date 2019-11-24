class CreateFamilyGroups < ActiveRecord::Migration[5.2]
	def change
		create_table :family_groups do |t|
			t.timestamps
		end

		change_table :users do |t|
			t.belongs_to :family_group
		end
	end
end
