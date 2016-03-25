class Like < ActiveRecord::Base
  belongs_to :user 
  belongs_to :liked, :class_name => "User"
  belongs_to :post
end
