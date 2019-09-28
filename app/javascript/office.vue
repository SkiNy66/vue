<!-- <template lang='pug'>
  div(v-if="loading")
    p Загрузка
  div(v-else id="app")
    div(v-if="error")
      p Ошибка
    div(v-else)
      q-layout
        q-page-container
          navbar(:current_email="current_email" :logoImage="logoImage")


      
      <dashboard :list='list' @addNewClient="addNewClient"></dashboard>
</template> -->

<template lang='pug'>
  q-layout(view="hHh lpR fFf")
    navbar(:current_email="current_email" :logoImage="logoImage")
    
    q-page-container
      div(v-if="loading")
        q-spinner(color="primary" size="3em" :thickness="10")
      div(v-else id="app")
        div(v-if="error")
          p Ошибка
        div(v-else)
          <!-- <dashboard :list='list' @addNewClient="addNewClient"></dashboard> -->
</template>

<!-- <template>
  <q-layout view="hHh lpR fFf">

    <q-header elevated class="bg-primary text-white">
      <q-toolbar>
        <q-toolbar-title>
          <q-avatar>
            <img src="https://cdn.quasar.dev/logo/svg/quasar-logo.svg">
          </q-avatar>
          Title
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template> -->

<script>
  import navbar from 'app/components/navbar.vue'
  import dashboard from 'app/components/dashboard.vue'
  import logoImage from 'images/logo.jpg';
  import { getClientsList, getCurrentStaffEmail, postNewClient } from 'app/api/'

  export default {
    data: function () {
      return {
        message: "STAFF OFFICE!",
        loading: true,
        error: false,
        current_email: '',
        list: [],
        logoImage
      }
    },
    components: {
      navbar,
      dashboard
    },
    created() {
      getClientsList()
        .then((response) => {
          this.list = response.data;
        })
        .catch((error) => {
          this.error = true;
        })
        .finally(() => {
          this.loading = false;
        });
      getCurrentStaffEmail() 
        .then((response) => {
          this.current_email = response.data['staff_email'];
        })
    },
    methods: {
      addNewClient: function(clientCredentials) {
        postNewClient(clientCredentials)
          .then((response) => {
            getClientsList()
              .then((response) => {
                this.list = response.data;
              })
              .catch((error) => {
                this.error = true;
              })
              .finally(() => {
                this.loading = false;
              });
          })
          .catch((error) => {
            console.log(error)
          })
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
