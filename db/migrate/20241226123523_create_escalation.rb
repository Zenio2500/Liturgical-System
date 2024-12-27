class CreateEscalation < ActiveRecord::Migration[8.0]
  def change
    create_table :escalations do |t|
      t.datetime :effective_date
      t.string :liturgical_time
      t.string :observation

      t.timestamps
    end
  end
end
