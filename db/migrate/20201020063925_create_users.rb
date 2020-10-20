class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :phone_number
      t.string :nric
      t.string :ic_image
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
