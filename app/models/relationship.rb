class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, :class_name => "User",foreign_key: "follower_id",dependent: :destroy
  has_many :posts,dependent: :destroy
end
