class AddStyleToPromotions < ActiveRecord::Migration
  def self.up
    add_column :promotions, :style_id, :integer
  end

  def self.down
    remove_column :promotions, :style_id
  end
end
