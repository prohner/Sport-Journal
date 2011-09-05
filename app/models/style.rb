# == Schema Information
# Schema version: 20110905214414
#
# Table name: styles
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  country_of_origin :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Style < ActiveRecord::Base
  has_many :promotions

  validates :name, 
            :presence => true,
            :length   => { :minimum => 4 }
  
end
