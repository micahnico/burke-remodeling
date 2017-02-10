class AddBooleansToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :prospect_stage, :boolean, null: false, default: false
    add_column :salons, :contact_stage, :boolean, null: false, default: false
    add_column :salons, :demo_stage, :boolean, null: false, default: false
    add_column :salons, :closed_no_stage, :boolean, null: false, default: false
    add_column :salons, :closed_yes_stage, :boolean, null: false, default: false
    add_column :salons, :called, :boolean, null: false, default: false
    add_column :salons, :spoke_to_human, :boolean, null: false, default: false
    add_column :salons, :owner_name, :boolean, null: false, default: false
    add_column :salons, :one_decision_maker, :boolean, null: false, default: false
    add_column :salons, :price_discussed, :boolean, null: false, default: false
    add_column :salons, :next_action_agreed, :boolean, null: false, default: false
    add_column :salons, :rep_asked_questions, :boolean, null: false, default: false
    add_column :salons, :owner_asked_questions, :boolean, null: false, default: false
    add_column :salons, :deadline_discussed, :boolean, null: false, default: false
    add_column :salons, :too_much, :boolean, null: false, default: false
    add_column :salons, :competition, :boolean, null: false, default: false
    add_column :salons, :missing_features, :boolean, null: false, default: false
    add_column :salons, :paperwork, :boolean, null: false, default: false
    add_column :salons, :paid, :boolean, null: false, default: false
    add_column :salons, :implemented, :boolean, null: false, default: false
  end
end
