class CreateWards < ActiveRecord::Migration[7.0]
  def change
    create_table :wards do |t|
      t.string :first_name
      t.string :last_name
      t.date :DOB
      t.string :gender
      t.decimal :height
      t.integer :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
