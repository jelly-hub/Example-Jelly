class ChangeFoodColumnName < ActiveRecord::Migration
  def change
  	rename_column :foods, :type, :gattung
  end
end
