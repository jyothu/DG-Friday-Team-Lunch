class CreateTeamLunchGroupEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :team_lunch_group_employees do |t|
      t.references :team_lunch_group, foreign_key: true
      t.references :employee, foreign_key: true
      t.boolean :leader

      t.timestamps
    end
  end
end
