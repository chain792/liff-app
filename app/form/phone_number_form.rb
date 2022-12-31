class PhoneNumberForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :number, :string

  validates :number, presence: true,
    format:  { with: /\A\+?\d+(-\d+)*\z/, allow_blank: true }
end
