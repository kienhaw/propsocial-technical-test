class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.references :ad, null: false, foreign_key: true
      t.references :source, polymorphic: true, null: false

      t.timestamps
    end
  end
end
