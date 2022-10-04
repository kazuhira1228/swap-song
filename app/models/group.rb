class Group < ApplicationRecord
  with_options presence: true do
    validates :group
    validates :first_user
    validates :second_user
    validates :third_user
    validates :fourth_user
    validates :fifth_user
    validates :group_since
    validates :text
  end

  belongs_to :user
  
end
