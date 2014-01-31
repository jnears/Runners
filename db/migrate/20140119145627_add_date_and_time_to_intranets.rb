class AddDateAndTimeToIntranets < ActiveRecord::Migration
  def change
    add_column :intranets, :start_time, :datetime
    add_column :intranets, :finish_time, :datetime
  end
end
