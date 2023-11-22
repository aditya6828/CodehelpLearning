class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :otp
      t.integer :role, default: 0, null: false
      
      t.timestamps
    end
  end
end
