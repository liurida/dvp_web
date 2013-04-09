class AddLdapEntriesToUser < ActiveRecord::Migration
  def change
    add_column :users, :ldap_entries, :text
  end
end
