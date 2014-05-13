# This migration comes from refinery_about_items (originally 1)
class CreateAboutItemsAboutItems < ActiveRecord::Migration

  def up
    create_table :refinery_about_items do |t|
      t.string :title
      t.text :info
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-about_items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/about_items/about_items"})
    end

    drop_table :refinery_about_items

  end

end
