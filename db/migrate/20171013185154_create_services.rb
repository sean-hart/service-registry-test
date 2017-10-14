class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :owner
      t.string :description
      t.string :language

      t.timestamps
    end
  end
end
