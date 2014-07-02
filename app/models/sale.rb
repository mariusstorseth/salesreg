class Sale < ActiveRecord::Base

  belongs_to :user
  belongs_to :client

  validates :client_id, :user_id, presence: true
  validates :software, :semi, :production, :ads, :other, numericality: { only_integer: true },
                                                         allow_blank: true

  before_save :calculate_coverage_ratios!, :calculate_product_margins!, 
              :calculate_revenue!, :calculate_margin!

  has_attached_file :file, styles: {thumbnail: "60x60#"}
  validates_attachment :file, content_type: { content_type: "application/pdf" }

  def self.search(client, date_from, date_to)
    date_from = '1992-02-19' if date_from == ''
    date_to = Time.now if date_to == ''

    if client && date_from && date_to
      Sale.joins(:client).where('clients.name LIKE ? and sales.created_at > ? and sales.created_at < ?', "%#{client}%", date_from.to_date.beginning_of_day, date_to.to_date.end_of_day)
    else
      all
    end
  end

  def calculate_coverage_ratios!
    self.software_rate ||= 80
    self.semi_rate ||= 70
    self.production_rate ||= 50
    self.ads_rate ||= 15
    self.other_rate ||= 0
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

     self.revenue = sum
  end

  def calculate_margin!
    sum = 0

    sum += software_margin if software
    sum += semi_margin if semi
    sum += production_margin if production
    sum += ads_margin if ads
    sum += other_margin if other

     self.margin = sum
  end

  def calculate_commission
    calculates_commission = 0
    
    if self.user.sales.where("created_at >= ?", self.created_at.at_beginning_of_month).sum(:margin) >= self.user.budgets.where("month >= ?", self.created_at.strftime("%B")).sum(:amount)
      calculates_commission = margin * 0.4
    elsif self.user.sales.where("created_at >= ?", self.created_at.at_beginning_of_month).sum(:margin) >= (self.user.budgets.where("month >= ?", self.created_at.strftime("%B")).sum(:amount) * 0.7)
      calculates_commission = margin * 0.2
    elsif self.user.sales.where("created_at >= ?", self.created_at.at_beginning_of_month).sum(:margin) < (self.user.budgets.where("month >= ?", self.created_at.strftime("%B")).sum(:amount) * 0.7)
      calculates_commission = 0
    end

    return calculates_commission
  end

  def self.this_month
    where("created_at > ?", Time.now.at_beginning_of_month) 
  end

end
