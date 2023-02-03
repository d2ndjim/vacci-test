class CreateVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :vaccination_type
      t.date :vaccination_date
      t.boolean :completed, default: false
      t.references :ward, null: false, foreign_key: true
      t.timestamps
    end
  end
end
