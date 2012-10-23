class CreateProjectorsProjectors < ActiveRecord::Migration

  def up
    create_table :refinery_projectors do |t|
      t.string :name
      t.string :page
      t.integer :zoom
      t.integer :position
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-projectors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/projectors/projectors"})
    end

    drop_table :refinery_projectors

  end

end
