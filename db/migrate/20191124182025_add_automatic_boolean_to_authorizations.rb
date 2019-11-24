class AddAutomaticBooleanToAuthorizations < ActiveRecord::Migration[5.2]
  def change
    add_column :authorizations, :automated, :bool, null: false, default: false
  end
end
