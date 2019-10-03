<template lang='pug'>
  q-layout(view="hHh lpR fFf")
    staffNavbar(:current_email="current_email" :logoImage="logoImage")

    q-drawer(show-if-above bordered)
      q-list(bordered separator)
        q-item(clickable :to={ name: 'Organizations' })
          q-item-section Organizations

        q-item(clickable :to={ name: 'Clients' })
          q-item-label Clients

        q-item(clickable :to={ name: 'Staffs' })
          q-item-label Staffs

    q-page-container
      div(v-if="loading")
        q-spinner(color="primary" size="3em" :thickness="10")
      div(v-else id="app")
        div(v-if="error")
          p Ошибка
        div(v-else)
          router-view
</template>

<script>
  import staffNavbar from 'app/components/staffNavbar.vue'
  import logoImage from 'images/logo.jpg'
  import { getCurrentStaffEmail } from 'app/api/'

  export default {
    data: function () {
      return {
        loading: true,
        error: false,
        current_email: '',
        logoImage
      }
    },
    components: {
      staffNavbar
    },
    created() {
      getCurrentStaffEmail() 
        .then((response) => {
          console.log(response)
          this.current_email = response.data['staff_email'];
        })
        .catch((error) => {
          this.error = true;
        })
        .finally(() => {
          this.loading = false;
        });
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
