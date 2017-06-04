class AddDateTimeToQuotations < ActiveRecord::Migration
  def change
    add_column :quotations, :date, :date
    add_column :quotations, :time, :time
  end
end
