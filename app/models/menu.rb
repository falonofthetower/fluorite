class Menu < ActiveRecord::Base
  include Sluggable

  has_many :menu_links
  has_many :links, through: :menu_links

  validates :name, presence: true, length: { minimum: 5 }

  sluggable_column :name
end
