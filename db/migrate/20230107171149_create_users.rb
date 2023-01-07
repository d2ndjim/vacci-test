class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :location
      t.string :relationship
      t.references :guardian, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
