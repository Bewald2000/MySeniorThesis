class AddExtraDataToWork < ActiveRecord::Migration[7.1]
  def change
    add_column :works, :status, :string
    add_column :works, :companyname, :string
  end
end
