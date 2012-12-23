# == Schema Information
#
# Table name: bios
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bio < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
end
