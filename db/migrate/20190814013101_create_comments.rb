class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :user_id
      t.integer :fact_id
      t.timestamps
    end
    add_index :comments, [:user_id, :fact_id]
    add_index :comments, :fact_id
  end
end
