class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, :class_name => "User"
  has_many :posts
end
