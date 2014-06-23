class Budget < ActiveRecord::Base

  belongs_to :user

  validates :amount, :month, :user_id, presence: true
  validates :amount, :user_id, numericality: { only_integer: true }
  validates_uniqueness_of :user_id, scope: [:month], message: ": The budget for chosen month has already been set for chosen seller."

  def self.search(month)
    where("month like ?", "%#{month}%") 
  end
end
