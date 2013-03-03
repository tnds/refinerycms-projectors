class AddIntervallRefresh < ActiveRecord::Migration

  def up
      add_column :refinery_projectors, :refresh, :boolean
      add_column :refinery_projectors, :interval, :integer

  end

  def down
  end

end
