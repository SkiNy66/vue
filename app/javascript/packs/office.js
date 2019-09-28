import Vue from 'vue'
import App from '../office.vue'
import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'

import '../app/assets/styles/quasar.styl'
import 'quasar/dist/quasar.ie.polyfills'

import {
   Quasar,
   QLayout,
   QHeader,
   QDrawer,
   QPageContainer,
   QPage,
   QBtn,
   QToolbar,
   QToolbarTitle,
   QAvatar,
   QSpinner,
   QTable,
   QInput
 } from 'quasar'
 
Vue.use(Quasar, {
   config: {},
   components: {
     QLayout,
     QHeader,
     QDrawer,
     QPageContainer,
     QPage,
     QBtn,
     QToolbar,
     QToolbarTitle,
     QAvatar,
     QSpinner,
     QTable,
     QInput
   },
   directives: {
   },
   iconSet: iconSet,
   plugins: {
   }
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
