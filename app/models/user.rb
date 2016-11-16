class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :articles, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy

  validates :full_name, presence: true
end
