class Office < ActiveRecord::Base

  has_many :users

  validates :name, :currency, presence: true, 
                                        format: { with: /\A[a-zA-ZÆæÅåØøöÖäÄ]+\z/, }
  validates :currency, length: { is: 3 }
end
