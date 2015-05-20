class CreateHackdays < ActiveRecord::Migration
  def change
    create_table :hackdays do |t|
      t.string :title
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
