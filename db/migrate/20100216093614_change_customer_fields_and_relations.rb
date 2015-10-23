class ChangeCustomerFieldsAndRelations < ActiveRecord::Migration
  def self.up
    execute("DELETE FROM invoices")
    add_column :invoices, :payment_id, :integer, :null => false
    add_foreign_key(:invoices, :payment_id, :payments, :id)
    
    add_column :customers, :mobile_phone, :boolean
    change_column :customers, :company_name, :string, :null => false
    rename_column :customers, :company_name, :name
    remove_column :customers, :first_name
    remove_column :customers, :last_name
    remove_column :customers, :street_n2
    rename_column :customers, :street, :street_line1
    change_column :customers, :street_n1, :string
    rename_column :customers, :street_n1, :street_line2
    rename_column :customers, :nip, :tax_number
    
  end

  def self.down
    raise ActiveRecord::IrreversableMigration
  end
end
