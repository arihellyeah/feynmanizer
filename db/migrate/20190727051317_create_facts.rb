class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|

      t.timestamps
      t.string :title
      t.text :blurb
      t.string :category

    end
  end
end
