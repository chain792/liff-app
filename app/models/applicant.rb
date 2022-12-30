class Applicant < ApplicationRecord
  # 登録は管理者が行う

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable, :rememberable
  devise :database_authenticatable, :validatable

  validates :name, presence: true

end
