class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true #extra setp to ensure uniqueness of email
  end
end
