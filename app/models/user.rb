class User < ActiveRecord::Base

  has_secure_password

  has_many :sales
  has_many :opportunities
  has_many :budgets
  belongs_to :office

  validates :first_name, :last_name, :email, :office_id, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, :username, format: { with: /\A[a-zA-ZÆæÅåØø]+\z/, }
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/ }
  validates :office_id, numericality: { only_integer: true }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_create { generate_token(:auth_token) }
  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end

  def generate_password_reset_token!
    update_attributes(:password_reset_token => SecureRandom.urlsafe_base64(48))
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def full_name
    first_name + " " + last_name
  end
end