class Assessment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :assessment, inclusion: [0..5], allow_nil: true
end
