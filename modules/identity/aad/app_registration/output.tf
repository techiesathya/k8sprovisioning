output "application_id" {
  value = azuread_application.app_registration.application_id
}

output "app_registration_password" {
  value = random_password.password.result
}

output "service_principal" {
  depends_on = [azuread_application.app_registration.application_id]
  value      = azuread_service_principal.service_principal.object_id
}
