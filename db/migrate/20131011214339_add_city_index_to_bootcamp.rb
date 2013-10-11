class AddCityIndexToBootcamp < ActiveRecord::Migration
  def change
    add_column :bootcamps, :city_index, :integer
  end
end
