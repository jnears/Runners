class CreateRunnerShoes < ActiveRecord::Migration
  def change
    create_table :runners_shoes do |t|
    	t.belongs_to :runner
    	t.belongs_to :shoe
    end
  end
end
