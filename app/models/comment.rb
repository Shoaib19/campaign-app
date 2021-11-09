class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commented_on , polymorphic: true
  
  validates :title, :user_id ,:presence => {:message => "dont't leave blank "}
end
