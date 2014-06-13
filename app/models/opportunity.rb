class Opportunity < ActiveRecord::Base

  belongs_to :user
  belongs_to :client

  validates :client_id, :user_id, presence: true
  validates :software, :semi, :production, :ads, :other, numericality: { only_integer: true },
                                                         allow_blank: true

  before_save :calculate_coverage_ratios!, :default_probability!, :calculate_product_margins!, 
              :calculate_revenue!, :calculate_margin!, :calculate_weight!

  def calculate_coverage_ratios!
    self.software_rate ||= 80
    self.semi_rate ||= 70
    self.production_rate ||= 50
    self.ads_rate ||= 15
    self.other_rate ||= 0
  end

  def default_probability!
    self.probability ||= 0
  end

  def calculate_product_margins!
    self.software_margin = software * software_rate / 100 if software
    self.semi_margin = semi * semi_rate / 100 if semi
    self.production_margin = production * production_rate / 100 if production
    self.ads_margin = ads * ads_rate / 100 if ads
    self.other_margin = other * other_rate / 100 if other
  end

  def calculate_revenue!
    sum = 0

    sum += software if software
    sum += semi if semi
    sum += production if production
    sum += ads if ads
    sum += other if other

     self.total_revenue = sum
  end

  def calculate_margin!
    sum = 0

    sum += software_margin if software
    sum += semi_margin if semi
    sum += production_margin if production
    sum += ads_margin if ads
    sum += other_margin if other

     self.total_margin = sum
  end

  def calculate_weight!
    self.weighted_revenue = total_revenue * probability / 100
    self.weighted_margin = total_margin * probability / 100
  end
  
  def self.this_month
    where("created_at > ?", Time.now.at_beginning_of_month) 
  end

end
