class AddLanguageToBootcamp < ActiveRecord::Migration
  def change
    add_column :bootcamps, :primary_language, :string
  end
end
