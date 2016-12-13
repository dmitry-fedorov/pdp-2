class Article < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, :text, presence: true

  delegate :owner, to: :company, prefix: true

  ratyrate_rateable "assessment"
end
