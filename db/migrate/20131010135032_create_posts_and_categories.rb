class CreatePostsAndCategories < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :excerpt
      t.text :body
      t.date :publish_date
      t.integer :user_id
      t.timestamps
  end

    create_table :categories do |t|
      t.string :name
      t.timestamps
  end
  
    create_table :categories_posts do |t|
      t.belongs_to :category
      t.belongs_to :post
  end
  end
end
