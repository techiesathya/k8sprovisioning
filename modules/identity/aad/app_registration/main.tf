resource "azuread_application" "app_registration" {
  name                       = var.name
  homepage                   = var.homepage
  identifier_uris            = var.identifier_uris
  reply_urls                 = var.reply_urls
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
}

resource "azuread_application_password" "application_password" {
  application_object_id = azuread_application.app_registration.id
  value                 = random_password.password.result
  end_date              = "2099-01-01T01:02:03Z"
}

resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "_%@"
}

resource "azuread_service_principal" "service_principal" {
  application_id               = azuread_application.app_registration.application_id
  app_role_assignment_required = false
}
