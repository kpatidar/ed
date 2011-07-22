class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_name
      t.string :login_password
      t.string :first_name
      t.string :last_name
      t.string :login_role
      t.string :email_id

      t.timestamps
    end
  end
end
