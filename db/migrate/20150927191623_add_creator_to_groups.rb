class AddCreatorToGroups < ActiveRecord::Migration
  def change
    add_reference :groups, :user, null: false
  end
end
