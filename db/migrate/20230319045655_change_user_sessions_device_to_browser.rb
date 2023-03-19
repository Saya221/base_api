class ChangeUserSessionsDeviceToBrowser < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_sessions, :device, :browser
  end
end
