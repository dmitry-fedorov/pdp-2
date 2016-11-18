class DeleteBlogs < ActiveRecord::Migration
  def change
    remove_reference :articles, :blog
    remove_reference :blogs, :company
    drop_table :blogs
    add_reference :articles, :company, index: true, foreign_key: true, null: false
  end
end
