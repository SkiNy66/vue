<template>
  <div v-if="loading">
    <p>Загрузка</p>
  </div>
  <div v-else id="app">
    <div v-if="error">
      <p>Ошибка</p>
    </div>
    <div v-else>
      <p>{{ message }}</p>
      <navbar :current_email="current_email" :logoImage="logoImage"></navbar>
      <dashboard :list='list' @addNewClient="addNewClient"></dashboard>
    </div>
  </div>
</template>

<script>
  import navbar from 'app/components/navbar.vue'
  import dashboard from 'app/components/dashboard.vue'
  import logoImage from 'images/logo.jpg';
  import { getClientsList, getCurrentStaffEmail, postNewClient } from 'app/api/api.js'

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
          this.list = response.data['list'];
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
                this.list = response.data['list'];
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
