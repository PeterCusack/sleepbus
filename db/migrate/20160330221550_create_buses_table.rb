class CreateBusesTable < ActiveRecord::Migration
  def change
    create_table :buses do |b|
      b.integer :id
      b.integer :seats

      b.timestamps
  end
end
