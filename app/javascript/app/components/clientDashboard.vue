<template lang='pug'>
  div
    h4 Clients Dashboard
    p(v-if="errors.length")
      b Пожалуйста исправьте указанные ошибки:
      ul
        li(v-for='error in errors') {{ error }}
    .q-pa-md
      .q-gutter-md(style='max-width: 300px')
        q-input(v-model='client.full_name' label='Full name')
        q-input(v-model='client.phone' label='Phone')
        q-input(v-model='client.email' label='email')
      b Organizations
        q-select(
                filled
                v-model="client.organization_ids"
                :options="organizationsOptions"
                multiple
                label="Organizations"
                style="width: 250px"
                emit-value)
    q-btn(push color="primary" @click="postNewClient" label="Add client")
    clientList(:clientsList="clientsList" @updateClient='postEditClient', :organizationsOptions='organizationsOptions')
</template>

<script>
  import clientList from 'app/components/clientList.vue'
  import { getClientsList,
           postNewClient,
           postEditClient,
           getOrganizationsList
         } from 'app/api/'

  export default {
    data: function () {
      return {
        client: {
          full_name: '',
          phone: '',
          email: '',
          organization_ids: []
        },
        clientsList: [],
        errors: [],
        organizationsOptions: []
      }
    },
    created() {
      this.getUpdatedClientsList()
      getOrganizationsList()
        .then((response) => {
          this.organizationsOptions = this.makeOrganizationsOptionList(response.data);
        })
        .catch((error) => {
          this.error = true;
        })
        .finally(() => {
          this.loading = false;
        });
    },
    methods: {
      getUpdatedClientsList: function() {
        getClientsList()
          .then((response) => {
            this.clientsList = response.data;
          })
          .catch((error) => {
            this.error = true;
          })
          .finally(() => {
            this.loading = false;
          });
      },
      postNewClient: function() {
        if (this.checkForm()) {
          postNewClient(this.client)
            .then((response) => {
              this.getUpdatedClientsList()
            })
            .catch((error) => {
              console.log(error)
            })
          this.client.full_name = ''
          this.client.phone = ''
          this.client.email = ''
          this.client.organization_ids = []
        }
      },
      postEditClient: function(staff) {
          postEditClient(staff)
            .then((response) => {
              this.getUpdatedClientsList()
            })
            .catch((error) => {
              console.log(error)
            })
      },
      checkForm: function (e) {
        this.errors = [];

        if (this.client.full_name.length < 5) {
          this.errors.push('Имя должно быть больше 4 символов');
        }
        if (this.client.phone.length != 10) {
          this.errors.push('Проверьте написание телефона, должно быть 10 символов');
        }
        
        if (!this.client.email) {
          this.errors.push('Укажите электронную почту.');
        } else if (!this.validEmail(this.client.email)) {
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
      makeOrganizationsOptionList: function(organizations) {
        var options_list = organizations.map(function(h) {
          var test = {}
          test['value'] = h['id']
          test['label'] = h['title']
          return test;
        });

        return options_list
      },
    },
    components: {
      clientList
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
