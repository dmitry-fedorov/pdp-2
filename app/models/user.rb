class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :invites, dependent: :destroy

  validates :full_name, presence: true

  enum role: %i(user admin)

  ratyrate_rater
end
