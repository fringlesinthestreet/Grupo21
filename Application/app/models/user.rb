class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :lockable
end
