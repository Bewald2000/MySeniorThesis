class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.string :aname
      t.string :string
      t.string :description
      t.date :awardeddate
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
