class CreateMarriages < ActiveRecord::Migration[7.0]
  def change
    create_table :marriages do |t|
      t.integer :wife_id
      t.integer :husband_id
      t.integer :m_year, default: 0
      t.integer :m_day, default: 0
      t.integer :m_month, default: 0

      t.timestamps
    end

    add_index :marriages, :wife_id
    add_index :marriages, :husband_id
  end
end
