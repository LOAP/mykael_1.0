# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title
  validates :title, :content, :presence => true
  validates :title, :length => { :maximum => 100 }
  validates :content, :length => { :maximum => 300 }

end
