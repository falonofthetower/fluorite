class CreateMenuLinks < ActiveRecord::Migration
  def change
    create_table :menu_links do |t|
      t.integer :menu_id, :link_id

      t.timestamps null: false
    end
  end
end
