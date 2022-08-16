class CreateShoppingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_days do |t|

      t.timestamps
    end
  end
end
