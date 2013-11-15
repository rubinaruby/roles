class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :alias
      t.belongs_to :client
      t.belongs_to :team_leader
      t.timestamps
    end
  end
end
