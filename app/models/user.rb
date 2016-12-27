class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :articles, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :invites, dependent: :destroy

  validates :full_name, presence: true

  enum role: %i(user admin)

  #scope :find_by_name_or_email, ->(search) { where("full_name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%") }
  #scope :filter_by_rating, ->(filter) { having("coalesce(AVG(avg), 0) >= ?", filter) }
end
