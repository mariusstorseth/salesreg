class Client < ActiveRecord::Base

  has_many :opportunities
  has_many :sales
  
  validates :name, presence: true
end
