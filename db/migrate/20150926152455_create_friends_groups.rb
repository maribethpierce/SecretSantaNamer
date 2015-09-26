class CreateFriendsGroups < ActiveRecord::Migration
  def change
    create_table :friends_groups do |t|
      t.belongs_to :user
      t.belongs_to :group
    end
  end
end
