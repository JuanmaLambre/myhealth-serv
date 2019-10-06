class AddCommentToAuthorizations < ActiveRecord::Migration[5.2]
  def change
    add_column :authorizations, :comment, :text
  end
end
