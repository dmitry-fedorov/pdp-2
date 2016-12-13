class DeleteAssessments < ActiveRecord::Migration
  def change
    remove_reference :assessments, :user
    remove_reference :assessments, :article
    drop_table :assessments
  end
end
