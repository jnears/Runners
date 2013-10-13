class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.belongs_to :runner
      t.string :city

      t.timestamps
    end
  end
end
