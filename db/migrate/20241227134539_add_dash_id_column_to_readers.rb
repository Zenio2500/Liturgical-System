class AddDashIdColumnToReaders < ActiveRecord::Migration[8.0]
  def change
    add_reference :readers, :dash, foreign_key: true
  end
end
