class CreateWorkoutSessions < ActiveRecord::Migration
  def self.up
    create_table :workout_sessions do |t|
      t.string :description
      t.integer :user_id
      t.date :workout_date

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_sessions
  end
end
