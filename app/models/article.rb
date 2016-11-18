class Article < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :assessments, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :text, presence: true
end
