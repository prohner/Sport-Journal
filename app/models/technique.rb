# == Schema Information
# Schema version: 20110908031037
#
# Table name: techniques
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Technique < ActiveRecord::Base
  belongs_to :user
end
