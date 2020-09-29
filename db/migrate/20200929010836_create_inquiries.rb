class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :title
      t.text :message
      t.string :email

      t.timestamps
    end
  end
end
