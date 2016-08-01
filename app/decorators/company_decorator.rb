class CompanyDecorator < ApplicationDecorator
  delegate :name, :owner
  delegate :full_name, to: :owner, prefix: true
end
