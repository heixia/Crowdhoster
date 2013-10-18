class AddHoursPerToBootcamps < ActiveRecord::Migration
  def change
    add_column :bootcamps, :hours_per_week, :integer
  end
end
