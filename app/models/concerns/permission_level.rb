module PermissionLevel

  extend ActiveSupport::Concern 
  
  def is_simple_user?
    %w(user admin superadmin).include?(self.role) 
  end

  def is_admin?
    %w(admin superadmin).include?(self.role)
  end

  def is_superadmin?
    %w(superadmin).include?(self.role)
  end
end