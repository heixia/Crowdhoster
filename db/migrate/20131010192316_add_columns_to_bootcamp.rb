class AddColumnsToBootcamp < ActiveRecord::Migration
  def change
    add_column :bootcamps, :tuition, :integer
    add_column :bootcamps, :hours, :integer
  end
end
