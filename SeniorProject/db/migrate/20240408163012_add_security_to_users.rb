class AddSecurityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :encryptedpassword, :string
    add_column :users, :persistencetoken, :string
    add_index :users, :persistencetoken
    add_column :users, :saccesstoken, :string
    add_index :users, :saccesstoken
    add_column :users, :perishtoken, :string
    add_index :users, :perishtoken
    add_column :users, :logincount, :integer
    add_column :users, :failedlogin, :integer
    add_column :users, :lastrequest, :datetime
    add_column :users, :currentlogin, :datetime
    add_column :users, :currentloginip, :string
    add_column :users, :lastloginip, :string
    add_column :users, :active, :boolean
    add_column :users, :approved, :boolean
    add_column :users, :cofirmed, :boolean
  end
end
