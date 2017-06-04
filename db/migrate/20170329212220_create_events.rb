class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :user
      t.references :quotation
      t.timestamps null: false
    end
  end
end
