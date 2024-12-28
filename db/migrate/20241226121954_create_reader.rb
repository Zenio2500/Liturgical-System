class CreateReader < ActiveRecord::Migration[8.0]
  def change
    create_table :readers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.datetime :birthday

      t.timestamps
    end
  end
end
