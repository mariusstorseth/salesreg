class Budget < ActiveRecord::Base

  belongs_to :user

  validates :amount, :month, :user_id, presence: true
  validates :amount, :user_id, numericality: { only_integer: true }
end
