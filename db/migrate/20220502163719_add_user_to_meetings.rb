class AddUserToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_reference :meetings, :user, foreign_key: true
  end
end
