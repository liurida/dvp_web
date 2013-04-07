#require 'net/ldap'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :registerable,   :recoverable,:validatable,:rememberable

  #devise :ldap_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  # disable devise, no password needs
  attr_accessible :login, :email, :username, :ldap_entries

  def ldap_info
    #load Marshaled obj
    Marshal.load(self.ldap_entries)
  end


  def self.authenticate(login, password)
    ldap = Net::LDAP.new
    ldap.host = 'bjpw01.f2.enterprise'
    ldap.auth("#{login}@research", password)

    if ldap.bind
      if user = find_by_login(login)
        user
      else
        user = create(:login => login)
        #get_ldap_info(login, password)
        filter = Net::LDAP::Filter.eq("samaccountname", login)
        base = "dc=f2, dc=enterprise"
        ldap_entry = nil
        ldap.search(:base => base, :filter => filter) {|entry| ldap_entry = entry}
        #p ldap_entry
        #ldap.mail
        user.email = ldap_entry.mail.first
        user.username = ldap_entry.displayname.first
        user.ldap_entries = Marshal.dump(ldap_entry)
        user.save
      end
    else
      nil
    end

  end

end
