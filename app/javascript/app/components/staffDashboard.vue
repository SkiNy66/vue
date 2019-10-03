<template lang='pug'>
  div
    h4 Staffs Dashboard
    p(v-if="errors.length")
      b Пожалуйста исправьте указанные ошибки:
      ul
        li(v-for='error in errors') {{ error }}
    .q-pa-md
      .q-gutter-md(style='max-width: 300px')
        q-input(v-model='staff.email' label='email')
    q-btn(push color="primary" @click="postNewStaff" label="Add staff")
    staffList(:staffsList="staffsList" @updateStaff='postEditStaff')
    h1 Linking
      q-select(
                filled
                v-model="link.organization_id"
                :options="options.organizationsOptions"
                label="Organization"
                style="width: 250px"
                emit-value)
      q-select(
                filled
                v-model="link.client_id"
                :options="options.clientsOptions"
                label="Client"
                style="width: 250px"
                emit-value)
      q-btn(push color="primary" @click="postLink" label="Create link")
</template>

<script>
  import staffList from 'app/components/staffList.vue'
  import { getStaffsList,
           postNewStaff,
           postEditStaff,
           getOrganizationsList,
           getClientsList,
           postClientOrganizationLink
         } from 'app/api/'

  export default {
    data: function () {
      return {
        staff: {
          email: ''
        },
        link: {
          organization_id: '',
          client_id: ''
        },
        staffsList: [],
        options: {
          organizationsOptions: [],
          clientsOptions: []
        },
        errors: []
      }
    },
    created() {
      this.getUpdatedStaffsList()
      getOrganizationsList()
        .then((response) => {
          this.options.organizationsOptions = this.makeOrganizationsOptionsList(response.data);
        })
      getClientsList()
        .then((response) => {
          this.options.clientsOptions = this.makeClientsOptionsList(response.data);
        })
    },
    methods: {
      getUpdatedStaffsList: function() {
        getStaffsList()
          .then((response) => {
            this.staffsList = response.data;
          })
          .catch((error) => {
            this.error = true;
          })
          .finally(() => {
            this.loading = false;
          });
      },
      postNewStaff: function() {
        if (this.checkForm()) {
          postNewStaff(this.staff)
            .then((response) => {
              this.getUpdatedStaffsList()
            })
            .catch((error) => {
              console.log(error)
            })
          this.staff.email = ''
        }
      },
      postEditStaff: function(staff) {
          postEditStaff(staff)
            .then((response) => {
              this.getUpdatedStaffsList()
            })
            .catch((error) => {
              console.log(error)
            })
      },
      checkForm: function (e) {
        this.errors = [];
        
        if (!this.staff.email) {
          this.errors.push('Укажите электронную почту.');
        } else if (!this.validEmail(this.staff.email)) {
          this.errors.push('Укажите корректный адрес электронной почты.');
        }

        if (!this.errors.length) {
          return true;
        }
      },
      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      },
      postLink: function() {
        postClientOrganizationLink(this.link)
      },
      makeOrganizationsOptionsList: function(organizations) {
        var options_list = organizations.map(function(h) {
          var test = {}
          test['value'] = h['id']
          test['label'] = h['title']
          return test;
        });

        return options_list
      },
      makeClientsOptionsList: function(clients) {
        var options_list = clients.map(function(h) {
          var test = {}
          test['value'] = h['id']
          test['label'] = h['full_name']
          return test;
        });

        return options_list
      }
    },
    components: {
      staffList
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
