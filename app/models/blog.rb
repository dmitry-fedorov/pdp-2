class Blog < ActiveRecord::Base
  belongs_to :company
  has_many :users
  has_many :articles, dependent: :destroy

  validates :name, presence: true
end
