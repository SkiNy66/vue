import axios from 'axios'
import Rails from 'rails-ujs';

axios.defaults.headers.post["Content-Type"] = "application/json"
axios.defaults.headers.post["X-CSRF-Token"] = Rails.csrfToken()
axios.defaults.headers.patch["X-CSRF-Token"] = Rails.csrfToken()
axios.defaults.headers.delete["X-CSRF-Token"] = Rails.csrfToken()

export function getCurrentStaffEmail() {
  return axios.get('/office/api/staffs/current_staff_email')
}

export function getClientsList() {
  return axios.get('/office/api/clients')
}

export function postNewClient(client_credentials) {
  return axios.post('/office/api/clients', { client: {...client_credentials} })
}

export function postEditClient(client_credentials) {
  return axios.patch('/office/api/clients/' + client_credentials.id, { client: { ...client_credentials }})
}

export function postResetPasswordClient(client_id) {
  return axios.post('/office/api/clients/' + client_id + '/reset_password')
}

export function getStaffsList() {
  return axios.get('/office/api/staffs')
}

export function postNewStaff(staff_credentials) {
  return axios.post('/office/api/staffs', { staff: {...staff_credentials} })
}

export function postEditStaff(staff_credentials) {
  return axios.patch('/office/api/staffs/' + staff_credentials.id, { staff: { email: staff_credentials.email }})
}

export function postResetPasswordStaff(staff_id) {
  return axios.post('/office/api/staffs/' + staff_id + '/reset_password')
}

export function getOrganizationsList() {
  return axios.get('/office/api/organizations')
}

export function postNewOrganization(organization_credentials) {
  return axios.post('/office/api/organizations', { organization: {...organization_credentials} })
}

export function postEditOrganization(organization_credentials) {
  return axios.patch('/office/api/organizations/' + organization_credentials.id, { organization: { ...organization_credentials }})
}

export function deleteOrganization(organization_id) {
  return axios.delete('/office/api/organizations/' + organization_id)
}

export function getHardwaresList() {
  return axios.get('/office/api/hardwares')
}

export function postClientOrganizationLink(link_params) {
  return axios.post('/office/api/staffs/link_client_with_organization', { link: link_params})
}
