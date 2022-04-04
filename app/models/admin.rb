class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :last_name
  validate :first_name
  validate :last_name_kana
  validate :first_name_kana
  validate :postal_code
  validate :address 
  validate :telephone_number
  validates :is_deleted, inclusion: { in: [true,false] }
end
