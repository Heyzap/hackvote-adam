class CreateHackdays < ActiveRecord::Migration
  
    create_table :hackdays do |t|
      t.string :title
      t.boolean :closed, :default => true

      t.timestamps null: false
    end
  end
end
