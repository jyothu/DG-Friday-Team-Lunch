class CreateTeamLunchGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :team_lunch_groups do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
