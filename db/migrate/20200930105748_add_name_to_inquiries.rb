class AddNameToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :name, :string
  end
end
