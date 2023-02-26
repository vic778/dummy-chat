class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, uniqueness: true
  has_many :messages


  def exept_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 30.days.from_now.to_i }, 'juubixSecret')
  end
end
