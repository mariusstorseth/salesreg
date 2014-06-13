class User < ActiveRecord::Base

  has_many :sales
  has_many :opportunities
  has_many :budgets
  belongs_to :office

  validates :first_name, :last_name, :email, :office_id, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, :username, format: { with: /\A[a-zA-ZÆæÅåØø]+\z/, }
  validates :email, format: { with: /\A[A-Za-z-9._%+-]+@[A-Za-z-9\.-]+\.[A-Za-z]+\Z/ }
  validates :office_id, numericality: { only_integer: true }


  def full_name
    first_name + " " + last_name
  end
end
