class CreateImmunizations < ActiveRecord::Migration[7.0]
  def change
    create_table :immunizations do |t|
      t.date :w6
      t.date :w10
      t.date :w14
      t.date :m6
      t.date :m9
      t.date :m12
      t.date :m15
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
