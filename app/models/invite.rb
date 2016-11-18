class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  enum status: %i(pending accepted declined)
end
