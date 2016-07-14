class Assessment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :assessment, numericality: { greather_than: 0, less_than: 6 }
end
