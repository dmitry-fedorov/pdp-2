class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table(:invites) do |t|
      t.integer    :status, null: false, default: 0
      t.references :user,    index: true, null: false
      t.references :company, index: true, null: false

      t.timestamps         null: false
    end
  end

  def self.down
    drop_table :invites
  end
end
