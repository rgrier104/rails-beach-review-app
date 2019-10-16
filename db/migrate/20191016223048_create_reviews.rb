class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :beach, null: false, foreign_key: true
      t.integer :overall_rating
      t.string :overall_description
      t.integer :parking_rating
      t.string :parking_description
      t.integer :surfing_rating
      t.string :surfing_description
      t.boolean :swimming
      t.boolean :snorkeling
      t.boolean :paddleboarding
      t.boolean :sunrise
      t.boolean :sunset

      t.timestamps
    end
  end
end
