class CreateComments < ActiveRecord::Migration
  def self.up
    create_table(:comments) do |t|
      t.string     :text,                                    null: false
      t.references :article, index: true, foreign_key: true, null: false
      t.references :user,    index: true, foreign_key: true, null: false

      t.timestamps                                           null: false
    end
  end

  def self.down
    drop_table :comments
  end
end
