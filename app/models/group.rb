class Group < ActiveRecord::based
  has_many :friends_groups
  has_many :users,
    through: :friends_groups

  validates :name, presence: true
end
