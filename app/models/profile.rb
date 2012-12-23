# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Profile < ActiveRecord::Base
  attr_accessible :image, :remote_image_url
  belongs_to :user
  mount_uploader :image, ImageUploader
  # attr_accessible :title, :body
end
