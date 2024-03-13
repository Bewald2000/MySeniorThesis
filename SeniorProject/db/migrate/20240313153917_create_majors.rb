class CreateMajors < ActiveRecord::Migration[7.1]
  def change
    create_table :majors do |t|
      t.string :majname
      t.string :status
      t.references :degree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
