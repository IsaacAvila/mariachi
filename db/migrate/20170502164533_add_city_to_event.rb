class AddCityToEvent < ActiveRecord::Migration
  def change
    add_column :events, :city, :string
  end
end
