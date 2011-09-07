# == Schema Information
# Schema version: 20110907041740
#
# Table name: promotions
#
#  id             :integer         not null, primary key
#  rank           :string(255)
#  user_id        :integer
#  promotion_date :date
#  created_at     :datetime
#  updated_at     :datetime
#  style_id       :integer
#

class Promotion < ActiveRecord::Base

  belongs_to :user
  belongs_to :style

  validates :rank,            :presence => true
  validates :user_id,         :presence => true
  validates :promotion_date,  :presence => true
  validates :style_id,        :presence => true

  default_scope :order => 'promotions.created_at desc'

end
