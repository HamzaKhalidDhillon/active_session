module ActiveSession
  def self.current_user
    RequestStore.store[:active_user] ||= if current_controller.present? && current_controller.class.method_defined?(:current_user)
                                           current_controller.send(:current_user)
                                         end
  end

  def self.current_user=(user)
    RequestStore.store[:active_user] = user
  end


  def self.current_token
    RequestStore.store[:active_token] ||= if current_controller.present? && current_controller.class.method_defined?(:current_token)
                                            current_controller.send(:current_token)
                                          end
  end

  def self.current_token=(token)
    RequestStore.store[:active_token] = token
  end

  def self.current_controller
    RequestStore.store[:active_controller]
  end

  def self.current_controller=(controller)
    RequestStore.store[:active_controller] = controller
  end
end
