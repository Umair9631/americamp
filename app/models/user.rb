class User < ApplicationRecord
  rolify

  ## Associations  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Validations
  validates :email, presence: true
  validates :password, presence: true, on: :create

  ## Hooks  

         
end
