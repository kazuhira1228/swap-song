class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :sex_id
    validates :prefecture_id
    validates :city
    validates :holiday_id
    validates :member_since
    validates :favorite_part
    validates :favorite_singer
    validates :group
    validates :holiday_id
  end
  
  has_many :activities
  has_many :groups
  has_many :comments

  validates :sex_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :holiday_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :more_join_id,  numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :holiday
  belongs_to :prefecture
  belongs_to :more_join

end
