class AddSortToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :sort, :integer
  end
end
