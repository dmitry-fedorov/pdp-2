class DeleteBlogs < ActiveRecord::Migration
  def self.up
    remove_reference :articles, :blog
    remove_reference :blogs, :company
    drop_table :blogs
    add_reference :articles, :company, index: true, foreign_key: true, null: false
  end

  def self.down
    create_table(:blogs) do |t|
      t.string     :name,                                    null: false
      t.references :company, index: true, foreign_key: true, null: false

      t.timestamps                                           null: false
    end

    remove_reference :articles, :company
    add_reference :articles, :blog, index: true, foreign_key: true, null: false
  end
end
