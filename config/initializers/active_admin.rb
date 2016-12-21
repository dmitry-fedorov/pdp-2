class AdminAutorizationAdapter < ActiveAdmin::AuthorizationAdapter
  def authorized?(_action, _subject = nil)
    user && user.admin?
  end
end

ActiveAdmin.setup do |config|
  config.authorization_adapter = "AdminAutorizationAdapter"
  config.site_title = "pdp"
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.on_unauthorized_access = :admin_access_denied!
  config.comments = false
  config.batch_actions = true
  config.localize_format = :long
end
