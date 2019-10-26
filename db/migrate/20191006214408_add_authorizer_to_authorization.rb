class AddAuthorizerToAuthorization < ActiveRecord::Migration[5.2]
  def change
    add_reference :authorizations, :authorizer
  end
end
