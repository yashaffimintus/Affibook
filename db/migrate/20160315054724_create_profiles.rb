class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :status
      t.string :gender
      t.string :address
      t.string :dob
      t.integer :user_id
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
