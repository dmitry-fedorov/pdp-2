class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_one :blog, dependent: :destroy
  belongs_to :owner, class_name: "User"

  validates :name, presence: true, uniqueness: true

  delegate :full_name, to: :owner, prefix: true
end
