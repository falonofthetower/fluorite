class MenuLink < ActiveRecord::Base
  belongs_to :link
  belongs_to :menu
end
