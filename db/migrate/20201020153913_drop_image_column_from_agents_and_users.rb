class DropImageColumnFromAgentsAndUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :agents, :ic_image
    remove_column :agents, :agent_id_image
    remove_column :users, :ic_image
  end
end
