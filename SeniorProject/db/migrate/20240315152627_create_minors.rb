class CreateMinors < ActiveRecord::Migration[7.1]
  def change
    create_table :minors do |t|
      t.string :minname
      t.string :status
      t.references :degree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
