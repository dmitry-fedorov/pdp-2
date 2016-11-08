class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table(:articles) do |t|
      t.string     :name,                                 null: false
      t.string     :text,                                 null: false
      t.references :blog, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps                                        null: false
    end
  end

  def self.down
    drop_table :articles
  end
end
