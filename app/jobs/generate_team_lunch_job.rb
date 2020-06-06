class GenerateTeamLunchJob < ApplicationJob
  queue_as :default

  def perform
    create_team_lunch_groups
    add_employees_to_groups
    choose_a_leader
  end

  private

  def add_employees_to_groups
    @groups.each do |team_lunch_group|
      until team_lunch_group.employees.size == Employee::TEAM_LUNCH_STRENGTH || employees_going_for_team_lunch.blank? do
        department_ids.each do |department_id|
          added_employee = employees_grouped_by_department[department_id].sample
          team_lunch_group.employees << added_employee

          employees_going_for_team_lunch.delete(added_employee)
          employees_grouped_by_department[department_id].delete(added_employee)
        end
      end
    end
  end

  def choose_a_leader
    @groups.each do |group|
      group.team_lunch_group_employees.sample.update(leader: true)
    end
  end

  def employees_going_for_team_lunch
    @employees_going_for_team_lunch ||= Employee.where(going_for_team_lunch: true)
  end

  def employees_grouped_by_department
    employees_going_for_team_lunch.group_by{ |employee| employee.department_id }
  end

  def team_lunch_date
  	Time.zone.today.beginning_of_week.advance(days: 4)
  end

  def create_team_lunch_groups
    @groups = []
    number_of_groups.times do |i| 
      @groups << TeamLunchGroup.create(name: "#{team_lunch_date}-group-#{i}", date: team_lunch_date)
    end
  end

  def number_of_groups
    employees_going_for_team_lunch.size/Employee::TEAM_LUNCH_STRENGTH
  end

  def department_ids
    @department_ids ||= Department.pluck(:id)
  end
end
