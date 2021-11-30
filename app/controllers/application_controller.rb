class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   def after_sign_in_path_for(resource)
      if current_teacher
        flash[:notice] = "ログインに成功しました"
        teacher_path
      else
        flash[:notice] = "ログインに成功しました"
       root_path
      end
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :student_number])
  end
end
