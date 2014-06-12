class User < ActiveRecord::Base
  has_many :sales
  has_many :opportunities
  has_many :budgets
  belongs_to :office

end
