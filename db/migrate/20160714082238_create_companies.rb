class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table(:companies) do |t|
      t.string     :name,               null: false
      t.references :owner, index: true, null: false

      t.timestamps         null: false
    end
  end

  def self.down
    drop_table :companies
  end
end
