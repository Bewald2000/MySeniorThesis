class CreateWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :works do |t|
      t.string :position
      t.string :string
      t.string :description
      t.date :sdate
      t.date :edate
      t.string :refname
      t.string :refphone
      t.string :refemail
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
