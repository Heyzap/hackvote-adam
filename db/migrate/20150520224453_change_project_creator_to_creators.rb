class ChangeProjectCreatorToCreators < ActiveRecord::Migration

  def change
  	rename_column :projects, :creator, :creators
  end

end
