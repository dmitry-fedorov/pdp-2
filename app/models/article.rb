class Article < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  has_many :assessments, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :text, presence: true
end
