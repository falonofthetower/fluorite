class User < ActiveRecord::Base
  has_many :infos, foreign_key: :creator_id
  has_many :links, foreign_key: :creator_id
  has_many :menus, foreign_key: :creator_id
end
