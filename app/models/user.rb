class User < ActiveRecord::Base
  has_and_belongs_to_many :roles


  def self.for_signin
    self.order('login asc').pluck(:login)
  end

  def has_role?(role_name)
    roles.map(&:name).include?(role_name)
  end

  def translator?
    has_role?('translator')
  end
  
end
