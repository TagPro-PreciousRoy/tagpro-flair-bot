class TagProProfile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :uid, uniqueness: { scope: :server }
end
