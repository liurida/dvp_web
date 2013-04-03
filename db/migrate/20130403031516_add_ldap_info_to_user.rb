class AddLdapInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :ldap_info, :text
  end
end
