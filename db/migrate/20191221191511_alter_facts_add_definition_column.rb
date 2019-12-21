class AlterFactsAddDefinitionColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :facts, :definition, :text
  end
end
