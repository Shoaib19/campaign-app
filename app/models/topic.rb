class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :campaign_tab
  has_many :comments, as: :commented_on, dependent: :destroy

  validates :title, :user_id, :campaign_tab_id, :presence => {:message => "dont't leave blank "}
end
