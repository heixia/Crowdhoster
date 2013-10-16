class AddPublishedToBootcamps < ActiveRecord::Migration
  def change
    add_column :bootcamps, :published, :boolean, :default => false
  end
end
