class ApplicationController < ActionController::Base
  
  private
  
  # ログイン後の画面遷移先設定
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # adminユーザー
      admin_orders_path
      
    else
      # customerユーザー
      root_path
    end
  end
  
  # ログアウト後の画面遷移先設定
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      # adminユーザー
      new_admin_session_path
      
    else
      # customerユーザー
      root_path
    end
  end
end
