class User < ApplicationRecord
  has_one :button, dependent: :destroy

  validates :user_id, presence: true, uniqueness: true
end
