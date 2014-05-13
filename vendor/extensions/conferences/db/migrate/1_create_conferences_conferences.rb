class CreateConferencesConferences < ActiveRecord::Migration

  def up
    create_table :refinery_conferences do |t|
      t.string :title
      t.datetime :date
      t.text :info
      t.integer :photo1_id
      t.integer :photo2_id
      t.integer :photo3_id
      t.integer :photo4_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-conferences"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/conferences/conferences"})
    end

    drop_table :refinery_conferences

  end

end
