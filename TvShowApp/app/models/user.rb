class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]
  has_many :tv_shows, :dependent => :destroy
  validates :name, uniqueness: {:case_sensitive => false}
  validates :email, :name, :birthday, :presence => true
  validate :validate_username
  validate :validate_age

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(name) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name)
      where(conditions.to).first
    end
  end



  private

  def validate_age
      if birthday.present? && birthday > 1.years.ago
          errors.add(:birthday, 'You should be over 1 years old.')
      elsif birthday < 110.years.ago
          errors.add(:birthday, 'You should have less than 110 years.')
      end
  end


  def validate_username
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end


end
