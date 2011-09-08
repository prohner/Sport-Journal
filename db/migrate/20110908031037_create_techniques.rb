class CreateTechniques < ActiveRecord::Migration
  def self.up
    create_table :techniques do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :techniques
  end
end
