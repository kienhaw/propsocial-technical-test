class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :inquiry, null: false, foreign_key: true
      t.references :source, polymorphic: true, null: false
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
