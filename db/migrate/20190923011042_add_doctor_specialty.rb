class AddDoctorSpecialty < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :specialty, :string
    add_reference :doctors, :specialty
  end
end
