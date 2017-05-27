class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => [:login]

  # Relaciones
  has_many :tv_shows, :dependent => :destroy
  # has_many :children, :class_name => 'User', :dependent => :destroy
  # belongs_to :parent, :class_name => 'User'

  # Login con FACEBOOK
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Validaciones:
  validates :name, uniqueness: {:case_sensitive => false}
  validates :email, :name, :presence => true
  validate :validate_username
  validate :validate_age

  attr_accessor :login


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      #user.first_name = auth.info.first_name
      #user.last_name = auth.info.last_name
      #user.birthday = Date.strptime(auth.extra.raw_info.birthday,'%d/%m/%Y')
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

  private

  def validate_age
    if birthday.present?
      if birthday > 1.years.ago
          errors.add(:birthday, 'You should be over 1 years old.')
      elsif birthday < 110.years.ago
          errors.add(:birthday, 'You should have less than 110 years.')
      end
    end
  end


  def validate_username
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end


end
