class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.string :rank
      t.integer :user_id
      t.date :promotion_date

      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
