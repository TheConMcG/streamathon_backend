class CreateServiceUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :service_users do |t|
      t.integer :service_id
      t.integer :user_id

      t.timestamps
    end
  end
end
