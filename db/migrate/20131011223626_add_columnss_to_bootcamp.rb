class AddColumnssToBootcamp < ActiveRecord::Migration
  def change
    add_column :bootcamps, :weeks, :integer
    add_column :bootcamps, :notes, :string
  end
end
