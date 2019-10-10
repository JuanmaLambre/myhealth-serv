class ActiveAdmin::ResourceController
  def check_model_errors(object)
    return unless object.errors.any?
    flash[:error] ||= []
    flash[:error].concat(object.errors.full_messages)
  end
end

class ActiveAdmin::ResourceDSL
  alias_method :old_run_registration_block, :run_registration_block
  def run_registration_block(&block)
    old_run_registration_block(&block)
    instance_exec { after_destroy :check_model_errors }
  end
end