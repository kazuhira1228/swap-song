class MoreJoin < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '希望あり'},
    { id: 3, name: '希望なし'}
  ]

  include ActiveHash::Associations
  has_many :users

end