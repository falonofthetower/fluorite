class User < ActiveRecord::Base
  has_secure_password

  has_many :infos, foreign_key: :creator_id
  has_many :links, foreign_key: :creator_id
  has_many :menus, foreign_key: :creator_id

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password, presence: true, on: :create
end
