class Office < ActiveRecord::Base

  has_many :users

  validates :name, :country, :currency, presence: true, 
                                        format: { with: /\A[a-zA-Z]+\z/, }
  validates :currency, length: { is: 3 }
end
