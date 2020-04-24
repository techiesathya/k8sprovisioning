output "application_id" {
  value = azuread_application.app_registration.application_id
}

output "app_registration_password" {
  depends_on = [azuread_application.app_registration, azuread_application.azuread_service_principal_password]
  value      = azuread_application_password.application_password.value

}

output "service_principal_id" {
  value = azuread_service_principal.service_principal.id
}

output "service_principle_password" {
  value = azuread_service_principal_password.service_principal_password.value
}
