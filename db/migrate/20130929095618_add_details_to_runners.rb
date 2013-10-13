class AddDetailsToRunners < ActiveRecord::Migration
  def change
    add_column :runners, :age, :string
    add_column :runners, :gender, :string
  end
end
