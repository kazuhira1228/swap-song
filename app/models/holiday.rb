class Holiday < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '土日休み'},
    { id: 3, name: 'シフト制'},
    { id: 4, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :users

end