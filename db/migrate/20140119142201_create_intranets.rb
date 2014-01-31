class CreateIntranets < ActiveRecord::Migration
  def change
    create_table :intranets do |t|
      t.text :category_name
      t.boolean :show

      t.timestamps
    end
  end
end
