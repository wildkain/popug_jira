# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, 'text', null: false

      primary_key [:filename]
    end

    create_table(:tasks) do
      primary_key :id
      column :title, 'text', null: false
      column :description, 'text', null: false
      column :status, 'text', default: 'unassigned', null: false
      column :created_at, 'timestamp without time zone', null: false
      column :updated_at, 'timestamp without time zone', null: false
    end
  end
end
Sequel.migration do
  change do
    self << 'SET search_path TO "$user", public'
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20210304215130_create_tasks.rb')"
  end
end
