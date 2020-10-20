class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :phone_number
      t.string :nric
      t.string :ic_image
      t.string :agent_id_image
      t.string :ren_no
      t.string :agency_name

      t.timestamps
    end
  end
end
