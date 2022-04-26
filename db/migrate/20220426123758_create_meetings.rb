class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.date :date
      t.string :time
      t.string :venue
      t.text :agenda
      t.text :minutes

      t.timestamps
    end
  end
end
