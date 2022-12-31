# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `GeneratedPathHelpersModule`.
# Please instead update this file by running `bin/tapioca dsl GeneratedPathHelpersModule`.

module GeneratedPathHelpersModule
  include ::ActionDispatch::Routing::UrlFor
  include ::ActionDispatch::Routing::PolymorphicRoutes

  sig { params(args: T.untyped).returns(String) }
  def account_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def courses_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_account_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_identity_email_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_identity_email_verification_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_identity_password_reset_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_active_storage_attachment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_active_storage_blob_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_active_storage_variant_record_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_author_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_course_permission_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_email_verification_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_instrument_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_password_reset_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_session_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_madmin_user_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_password_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_rails_conductor_inbound_email_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def edit_tab_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def enrollments_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def exercises_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def identity_email_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def identity_email_verification_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def identity_password_reset_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_attachment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_attachments_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_blob_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_blobs_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_variant_record_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_active_storage_variant_records_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_author_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_authors_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_course_permission_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_course_permissions_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_courses_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_email_verification_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_email_verification_tokens_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_enrollments_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_exercises_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_instrument_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_instruments_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_password_reset_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_password_reset_tokens_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_profiles_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_root_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_session_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_sessions_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_user_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def madmin_users_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_account_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_identity_password_reset_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_active_storage_attachment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_active_storage_blob_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_active_storage_variant_record_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_author_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_course_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_course_permission_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_email_verification_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_enrollment_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_exercise_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_instrument_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_password_reset_token_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_session_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_madmin_user_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_source_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def new_tab_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def password_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def preview_view_component_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def preview_view_components_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def profile_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_blob_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_blob_representation_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_blob_representation_proxy_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_conductor_inbound_email_incinerate_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_conductor_inbound_email_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_conductor_inbound_email_reroute_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_conductor_inbound_email_sources_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_conductor_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_direct_uploads_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_disk_service_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_info_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_info_properties_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_info_routes_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_mailers_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_mailgun_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_mandrill_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_mandrill_inbound_health_check_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_postmark_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_relay_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_representation_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_sendgrid_inbound_emails_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_service_blob_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_service_blob_proxy_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_storage_proxy_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def rails_storage_redirect_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def root_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def session_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def sessions_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def sign_in_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def sign_up_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def tab_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def tabs_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def turbo_recede_historical_location_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def turbo_refresh_historical_location_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def turbo_resume_historical_location_path(*args); end

  sig { params(args: T.untyped).returns(String) }
  def update_rails_disk_service_path(*args); end
end
