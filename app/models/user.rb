class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # Defaultno
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  
  devise :database_authenticatable, :validatable

  has_many :quizzes

  def name
    email.split("@").first.capitalize
  end
end
