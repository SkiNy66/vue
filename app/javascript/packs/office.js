import Vue from 'vue'
import App from '../office.vue'
import router from '../app/router'


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
   QInput,
   QList,
   QItem,
   QItemSection,
   QItemLabel,
   QDialog,
   ClosePopup,
   QCard,
   QCardSection,
   QCardActions,
   QSelect
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
     QInput,
     QList,
     QItem,
     QItemSection,
     QItemLabel,
     QDialog,
     QCard,
     QCardSection,
     QCardActions,
     QSelect
   },
   directives: {
     ClosePopup
   },
   iconSet: iconSet,
   plugins: {
   }
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
    router
  }).$mount()
  document.body.appendChild(app.$el)
})
