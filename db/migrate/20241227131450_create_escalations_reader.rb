class CreateEscalationsReader < ActiveRecord::Migration[8.0]
  def change
    create_table :escalations_readers do |t|
      t.references :escalation
      t.references :reader
      t.string :role
      t.boolean :did_serve

      t.timestamps
    end
  end
end
