class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.timestamps
    end
  end

    create_table :slides do |t|
      t.belongs_to :slider
      t.text :description
      t.text :image
      t.timestamps
    end
end




