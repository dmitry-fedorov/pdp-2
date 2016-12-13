class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :company, :ratings_given

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
