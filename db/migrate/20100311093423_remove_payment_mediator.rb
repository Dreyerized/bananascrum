class RemovePaymentMediator < ActiveRecord::Migration
  def self.up
    add_column(:domains, :billing_profile_id, :string, :null => true, :limit => 19)
    add_index(:domains, :billing_profile_id, :unique => true)
    add_column(:domains, :billing_agreement_status, :string, :null => true, :limit => 16)
  end

  def self.down
    remove_column(:domains, :billing_profile_id)
    remove_column(:domains, :billing_agreement_status)
  end
end
