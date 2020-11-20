class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :houses
  has_many :commecial_units
  has_many :complex_buildings
  has_one :user_role
  has_one :role, through: :user_role
end
