class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :enrollments
  has_many :courses, through: :enrollments

  validates :first_name, length: { minimum: 3,  maximum: 30 }, presence: true
  validates :last_name, length: { minimum: 3,  maximum: 30 }, presence: true
  validates :email, {
    email: true,
    length: { minimum: 3,  maximum: 50 },
    presence: true,
    uniqueness: true,
    confirmation: true
  }
  validates :email_confirmation, presence: true

  def to_s
    return first_name + ' ' + last_name
  end
end
