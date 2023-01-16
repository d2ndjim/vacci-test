class CreateWards < ActiveRecord::Migration[7.0]
  def change
    create_table :wards do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :DOB, null: false
      t.string :gender, null: false
      t.decimal :height
      t.decimal :weight

      t.timestamps
    end
  end
end
