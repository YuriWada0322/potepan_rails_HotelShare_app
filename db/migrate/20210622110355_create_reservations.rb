class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :people
      t.integer :total
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
