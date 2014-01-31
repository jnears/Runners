class CreateRelateds < ActiveRecord::Migration
  def change
    create_table :relateds do |t|
      t.text :weburl

      t.timestamps
    end
  end
end
