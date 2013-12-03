class AddFlairAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :flair_class, :string
    add_column :users, :flair_text, :string
  end
end
