class CreateTechniqueRepetitions < ActiveRecord::Migration
  def self.up
    create_table :technique_repetitions do |t|
      t.integer :technique_id
      t.integer :user_id
      t.integer :repetitions
      t.integer :workout_session_id

      t.timestamps
    end
  end

  def self.down
    drop_table :technique_repetitions
  end
end
