class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.belongs_to :client
      t.timestamps
    end
  end
end
