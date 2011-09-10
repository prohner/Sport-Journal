class AddDescriptionToTechnique < ActiveRecord::Migration
  def self.up
    add_column :techniques, :description, :string
  end

  def self.down
    remove_column :techniques, :description
  end
end
