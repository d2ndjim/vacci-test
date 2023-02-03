class CreateImmunizations < ActiveRecord::Migration[7.0]
  def change
    create_table :immunizations do |t|
      t.string :name
      t.string :vaccination_type  
      t.date :vaccination_date
      t.integer :reminder_days, default: 1
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
