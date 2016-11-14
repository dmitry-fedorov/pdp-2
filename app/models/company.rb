class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_one :blog, dependent: :destroy
  belongs_to :owner, class_name: "User"

  validates :name, :domain, presence: true, uniqueness: true
  validates_format_of :domain, with: /\A[a-z0-9]+(_{1}[a-z0-9]+)*$\z/

  delegate :full_name, to: :owner, prefix: true
end
