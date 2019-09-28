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
          organizationDashboard(:organizationsList='organizationsList' @postNewOrganization="postNewOrganization" @deleteOrganization="deleteOrganization")
          <!-- dashboard(:list='list' @addNewClient="addNewClient") -->
</template>

<script>
  import navbar from 'app/components/navbar.vue'
  import dashboard from 'app/components/dashboard.vue'
  import organizationDashboard from 'app/components/organizationDashboard.vue'
  import logoImage from 'images/logo.jpg'
  import { getClientsList,
           getCurrentStaffEmail,
           postNewClient,
           getOrganizationsList,
           postNewOrganization,
           deleteOrganization } from 'app/api/'

  export default {
    data: function () {
      return {
        message: "STAFF OFFICE!",
        loading: true,
        error: false,
        current_email: '',
        list: [],
        organizationsList: [],
        logoImage
      }
    },
    components: {
      navbar,
      dashboard,
      organizationDashboard
    },
    created() {
      // getClientsList()
      //   .then((response) => {
      //     this.list = response.data;
      //   })
      //   .catch((error) => {
      //     this.error = true;
      //   })
      //   .finally(() => {
      //     this.loading = false;
      //   });
      getCurrentStaffEmail() 
        .then((response) => {
          this.current_email = response.data['staff_email'];
        })
      getOrganizationsList()
        .then((response) => {
          this.organizationsList = response.data;
        })
        .catch((error) => {
          this.error = true;
        })
        .finally(() => {
          this.loading = false;
        });
    },
    methods: {
      // addNewClient: function(clientCredentials) {
      //   postNewClient(clientCredentials)
      //     .then((response) => {
      //       getClientsList()
      //         .then((response) => {
      //           this.list = response.data;
      //         })
      //         .catch((error) => {
      //           this.error = true;
      //         })
      //         .finally(() => {
      //           this.loading = false;
      //         });
      //     })
      //     .catch((error) => {
      //       console.log(error)
      //     })
      // }
      postNewOrganization: function(organizationCredentials) {
        postNewOrganization(organizationCredentials)
          .then((response) => {
            getOrganizationsList()
              .then((response) => {
                this.organizationsList = response.data;
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
      },
      deleteOrganization: function(organization_id) {
        deleteOrganization(organization_id)
          .then((response) => {
            getOrganizationsList()
              .then((response) => {
                this.organizationsList = response.data;
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
