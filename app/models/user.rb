class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :pools
  has_many :commissioners
  has_many :picks

  def full_name
    "#{first_name} #{last_name}"
  end
end
