# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :tasks do
      primary_key :id
      column :title, :text, null: false
      column :description, :text, null: false
      column :status, :text, null: false, default: 'unassigned'
      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end
end
