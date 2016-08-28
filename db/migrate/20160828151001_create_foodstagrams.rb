class CreateFoodstagrams < ActiveRecord::Migration[5.0]
  def change
    create_table :foodstagrams do |t|
      t.integer :instagram_id, :limit => 8
      t.string :img
      t.string :tag

      t.timestamps
    end
  end
end
