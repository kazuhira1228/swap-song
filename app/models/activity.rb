class Activity < ApplicationRecord

  with_options presence: true do
    validates :group
    validates :activity_day
    validates :song
    validates :studio
    validates :text
  end

  belongs_to :user
  has_many :comments
  has_one_attached :image

end
