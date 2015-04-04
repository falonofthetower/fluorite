class Link < ActiveRecord::Base
  has_many :menu_links
  has_many :menus, through: :menu_links

  validates :url, presence: true
  validates :name, presence: true, length: { minimum: 5 }
end
