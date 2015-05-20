class CreateHackdays < ActiveRecord::Migration
  
    create_table :hackdays do |t|
      t.string :title
      t.boolean :closed, :default => false

      t.timestamps null: false
    end
  end
end
