class Group < ActiveRecord::based
  has_many :friends_groups

  validates :name, presence: true
end
