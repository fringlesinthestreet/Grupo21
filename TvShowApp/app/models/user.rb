class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]
  has_many :tv_shows
  validates :name, uniqueness: {:case_sensitive => false}
  validates :email, :password, :name, :birthday, :presence => true
  validate :validate_username
  validate :validate_birthdate

  attr_accessor :login

  def validate_birthdate
    time = Time.now.strftime("%Y-%m-%d")
    if time < :birthday.to_s
      errors.add(:birthday, :invalid)
    end
  end

  def validate_username
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(name) = :value", { :value => login.downcase }]).first
        elsif conditions.has_key?(:name)
          where(conditions.to).first
        end
      end
end
