# == Schema Information
# Schema version: 20110910035042
#
# Table name: techniques
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class Technique < ActiveRecord::Base
  belongs_to :user

  validates :name,  :presence => true,
                    :length   => { :minimum => 3 }
end
