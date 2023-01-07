class CreateJoinUsersWards < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :wards do |t|
      t.index :user_id
      t.index :ward_id
      
      t.timestamps
    end
  end
end
