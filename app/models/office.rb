class Office < ActiveRecord::Base

  has_many :users

  validates :name, :currency, presence: true
  validates :currency, length: { is: 3 }
end
