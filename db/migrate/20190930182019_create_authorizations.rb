class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.belongs_to :requester, class_name: 'User'
      t.references :provider, class_name: 'HealthProvider'
      t.references :specialty
      t.string :status
      t.datetime :processed_time

      # Default created_at
      # TODO: admin user who processed the request
      # TODO: aprobation image
      # TODO: not so sure. User image


      t.timestamps
    end
  end
end
