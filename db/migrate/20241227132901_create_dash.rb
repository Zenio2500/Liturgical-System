class CreateDash < ActiveRecord::Migration[8.0]
  def change
    create_table :dashes do |t|
      t.references :reader
      t.bigint :absolute_frequency
      t.float :relative_frequency
      t.bigint :total_escalations

      t.timestamps
    end
  end
end
