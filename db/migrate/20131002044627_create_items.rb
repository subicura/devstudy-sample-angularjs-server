class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :name
      t.float  :price
      t.text   :memo
      t.timestamps
    end
  end
end
