class ChangeHackdayTitle < ActiveRecord::Migration
  def change
    change_column :hackdays, :title, :string, :null => false
  end
end
