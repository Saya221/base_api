class ChangeUsersPhoneNumberToStr < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      t.change :phone_number, :string
    end
  end

  def down 
    change_table :users do |t|
      t.change :phone_number, :integer
    end
  end
end
