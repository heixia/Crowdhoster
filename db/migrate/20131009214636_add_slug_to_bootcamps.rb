class AddSlugToBootcamps < ActiveRecord::Migration
  def change
    add_column :bootcamps, :slug, :string
  end
end
