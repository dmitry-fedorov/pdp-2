class AddDomainToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :domain, :string, null: false
  end
end
