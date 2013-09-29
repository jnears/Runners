class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :make
      t.string :size
      t.string :shoe_type

      t.timestamps
    end
  end
end
