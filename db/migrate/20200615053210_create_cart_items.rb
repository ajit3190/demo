class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
    	t.references :cart
    	t.references :service
      t.timestamps
    end
  end
end
