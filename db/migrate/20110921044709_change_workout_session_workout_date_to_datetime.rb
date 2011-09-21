class ChangeWorkoutSessionWorkoutDateToDatetime < ActiveRecord::Migration
  def self.up
    change_column :workout_sessions, :workout_date, :datetime
  end

  def self.down
    change_column :workout_sessions, :workout_date, :date
  end
end
