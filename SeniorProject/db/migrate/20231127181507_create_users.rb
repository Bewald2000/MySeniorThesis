class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :fnames
      t.text :lname
      t.string :prename
      t.string :username
      t.string :passcode
      t.string :email
      t.string :phonenumber

      t.timestamps
    end
  end
end
