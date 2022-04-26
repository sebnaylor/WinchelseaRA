class AddNameAndMembershipNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :membership_number, :integer
  end
end
