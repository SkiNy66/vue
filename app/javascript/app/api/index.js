import axios from 'axios'
import Rails from 'rails-ujs';

axios.defaults.headers.post["Content-Type"] = "application/json"
axios.defaults.headers.post["X-CSRF-Token"] = Rails.csrfToken()

export function getClientsList() {
  return axios.get('/office/list')
}

export function getCurrentStaffEmail() {
  return axios.get('/office/current_staff_email')
}

export function postNewClient(client_credentials) {
  return axios.post('/office/create_new_client', { client: client_credentials })
}

export function getOrganizationsList() {
  return axios.get('/office/organizations')
}

export function postNewOrganization(organization_credentials) {
  return axios.post('/office/organizations', { organization: organization_credentials })
}

export function deleteOrganization(organization_id) {
  console.log(organization_id)
  return axios.delete('/office/organizations/' + organization_id)
}
