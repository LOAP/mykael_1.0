# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink
  validates_uniqueness_of :permalink

  def to_param
    permalink
  end
end
