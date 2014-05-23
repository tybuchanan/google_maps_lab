class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :email, index: true
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
