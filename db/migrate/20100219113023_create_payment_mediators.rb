class CreatePaymentMediators < ActiveRecord::Migration
  def self.up
    remove_column(:customers, :paypal_profile_id)
    remove_column(:domains, :rebilling_agreement_status)
  end

  def self.down
    add_column(:customers, :paypal_profile_id, :string, :null => true, :limit => 19)
    add_index(:customers, :paypal_profile_id, :unique => true)

    add_column(:domains, :rebilling_agreement_status, :integer, :null => true, :default => nil)
  end
end
