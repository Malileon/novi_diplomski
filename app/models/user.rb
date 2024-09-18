class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # Defaultno
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  
  devise :database_authenticatable, :validatable, :registerable

  has_many :quizzes
  has_many :quiz_sessions

  validates :username, presence: true
  validates :is_admin, numericality: { only_integer: true, in: 0..1 }

  def name
    username.capitalize
  end
end
