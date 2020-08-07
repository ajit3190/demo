class AddRoleidToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :role_id, :integer, :default => 2
  end
end
