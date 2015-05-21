class AddHackdayToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :hackday, index: true
    add_foreign_key :projects, :hackdays
  end
end
