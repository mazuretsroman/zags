class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, null: false
      t.integer :year, default: 0
      t.integer :day,  default: 0
      t.integer :month, default: 0

      t.timestamps
    end
  end
end
