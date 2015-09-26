class User < ActiveRecord::Base
  has_many :friends_groups
  has_many :groups,
    through: :friends_groups
  validates :name, presence: true
  validates :email, uniquesness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
