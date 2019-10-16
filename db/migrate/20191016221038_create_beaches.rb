class CreateBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :beaches do |t|
      t.string :name
      t.string :city
      t.string :shore

      t.timestamps
    end
  end
end
