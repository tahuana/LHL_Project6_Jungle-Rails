class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
