class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :articles, dependent: :destroy
  belongs_to :owner, class_name: "User"

  validates :name, :domain, presence: true, uniqueness: true
  validates :domain, format: /\A[a-z0-9]+(_{1}[a-z0-9]+)*$\z/, length: { maximum: 63 }

  delegate :full_name, to: :owner, prefix: true

  def average_rating(direction)
    direction ||= "desc"
    users
      .joins("LEFT JOIN articles ON articles.user_id = users.id")
      .joins("LEFT JOIN rating_caches rc ON articles.id = rc.cacheable_id")
      .group(:id).order("coalesce(AVG(avg), 0) #{direction}")
  end

  def article_count(direction)
    users
      .joins("LEFT JOIN articles ON articles.user_id = users.id")
      .joins("LEFT JOIN rating_caches rc ON articles.id = rc.cacheable_id")
      .group(:id).order("articles.count #{direction}, coalesce(AVG(avg), 0) DESC")
  end
end
