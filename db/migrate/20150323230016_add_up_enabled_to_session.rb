class AddUpEnabledToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :up_enabled, :boolean
    update "UPDATE sessions SET up_enabled=#{quoted_true}"
  end
end
