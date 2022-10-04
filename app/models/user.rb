class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,      format:       { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :sex_id,        numericality: { other_then: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_then: 1, message: "can't be blank" }
    validates :city
    validates :holiday_id,    numericality: { other_then: 1, message: "can't be blank" }
    validates :member_since
    validates :favorite_part
    validates :group
    validates :more_join_id,  numericality: { other_then: 1, message: "can't be blank" }
  end
  
  has_many :activities
  has_many :groups
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :holiday
  belongs_to :prefecture
  belongs_to :more_join

end
