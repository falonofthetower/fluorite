class Menu < ActiveRecord::Base
  has_many :menu_links
  has_many :links, through: :menu_links
end
