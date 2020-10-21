class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :property_name
      t.decimal :price
      t.string :ad_type
      t.references :source, polymorphic: true, null: false

      t.timestamps
    end
  end
end
