class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table(:blogs) do |t|
      t.string     :name,                                    null: false
      t.references :company, index: true, foreign_key: true, null: false

      t.timestamps                                           null: false
    end
  end

  def self.down
    drop_table :blogs
  end
end
