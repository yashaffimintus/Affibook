class User < ActiveRecord::Base
  has_many :posts,dependent:   :destroy
  has_many :comments
  has_one :profile, dependent: :destroy
  mount_uploader :avatar, AvatarUploader                          

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { admin: 1 , user: 2}  
  #add_attachment :users, :picture 
   #has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  #validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  # def follow(other_user)
  #   active_relationships.create(followed_id: other_user.id)
  # end
  
  has_many :relationships,dependent: :destroy
  has_many :followed, :through => :relationships
  has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "followed_id"
  has_many :inverse_relationships, :through => :inverse_relationships, :source => :user
  # # Unfollows a user.
  # def unfollow(other_user)
  #   active_relationships.find_by(followed_id: other_user.id).destroy
  # end
  has_many :friendships,dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # # Returns true if the current user is following the other user.
  # def following?(other_user)
  #   following.include?(other_user)
  # end
  has_many :likes,dependent: :destroy

end

