class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(course)
    enrolled_courses = []
    enrollments.each do |enrollment|
      enrolled_courses << enrollment.course
    end
  end

end
