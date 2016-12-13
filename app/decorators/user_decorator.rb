class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :company, :ratings_given

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def average_rating
    RatingCache.where(cacheable_id: object.articles.ids).average(:avg).round(2).to_digits
  end
end
