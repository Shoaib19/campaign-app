class CampaignTab < ApplicationRecord
  belongs_to :user
  has_many :topics , dependent: :destroy
  has_many :comments, as: :commented_on, dependent: :destroy
  has_many :todo , dependent: :destroy
  has_many :tags , dependent: :destroy
    
  validates :title, :purpose, :estimated_duration,:user_id, :presence => {:message => "dont't leave blank "}
end
