class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string :client
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.text :description
      t.timestamps null: false
    end
  end
end
