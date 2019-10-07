import Vue from 'vue'
import VueRoter from 'vue-router'

Vue.use(VueRoter)

import organizationDashboard from '../components/organizationDashboard.vue'
import clientDashboard from '../components/clientDashboard.vue'
import staffDashboard from '../components/staffDashboard.vue'
import hardwareDashboard from '../components/hardwareDashboard.vue'

export default new VueRoter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/office/organs', component: organizationDashboard, name: 'Organizations' },
    { path: '/office/clients', component: clientDashboard, name: 'Clients' },
    { path: '/office/staffs', component: staffDashboard, name: 'Staffs' },
    { path: '/office/hardwares', component: hardwareDashboard, name: 'Hardwares' }
  ]
})