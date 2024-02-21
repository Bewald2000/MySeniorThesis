class CreateDegrees < ActiveRecord::Migration[7.1]
  def change
    create_table :degrees do |t|
      t.string :schoolname
      t.date :sdate
      t.date :edate
      t.string :educationlevel
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
