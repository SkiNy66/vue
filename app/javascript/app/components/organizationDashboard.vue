<template lang='pug'>
  div
    h4 Organizations Dashboard
    p(v-if="errors.length")
      b Пожалуйста исправьте указанные ошибки:
      ul
        li(v-for='error in errors') {{ error }}
    .q-pa-md
      .q-gutter-md(style='max-width: 300px')
        q-input(v-model='organization.title' label='Title')
        q-input(v-model='organization.kind' label='kind')
        q-input(v-model='organization.iin' label='iin')
        q-input(v-model='organization.ogrn' label='ogrn')
    q-btn(push color="primary" @click="postNewOrganization" label="Add organization")
    organizationList(:organizationsList="organizationsList", @deleteOrganization="deleteOrganization" @updateOrganization='postEditOrganization')
</template>

<script>
  import organizationList from 'app/components/organizationList.vue'
  import { getOrganizationsList,
           postNewOrganization,
           postEditOrganization,
           deleteOrganization
         } from 'app/api/'

  export default {
    data: function () {
      return {
        organization: {
          title: '',
          kind: '',
          iin: '',
          ogrn: ''
        },
        organizationsList: [],
        errors: []
      }
    },
    created() {
      this.getUpdatedOrganizationsList()
    },
    methods: {
      getUpdatedOrganizationsList: function() {
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
      postNewOrganization: function() {
        if (this.checkForm()) {
          postNewOrganization(this.organization)
            .then((response) => {
              this.getUpdatedOrganizationsList()
            })
            .catch((error) => {
              console.log(error)
            })
          this.organization.title = ''
          this.organization.kind = ''
          this.organization.iin = ''
          this.organization.ogrn = ''
        }
      },
      postEditOrganization: function(organization) {
        postEditOrganization(organization)
          .then((response) => {
            this.getUpdatedOrganizationsList()
          })
          .catch((error) => {
            console.log(error)
          })
      },
      checkForm: function (e) {
        this.errors = [];

        if (this.organization.title.length < 1) {
          this.errors.push('Title не должен быть пустым');
        }
        if (this.organization.kind.length < 1) {
          this.errors.push('kind не должен быть пустым');
        }
        if (this.organization.iin.length < 1) {
          this.errors.push('iin не должен быть пустым');
        }
        if (this.organization.ogrn.length < 1) {
          this.errors.push('ogrn не должен быть пустым');
        }

        if (!this.errors.length) {
          return true;
        }
      },
      deleteOrganization: function(organization_id) {
        deleteOrganization(organization_id)
          .then((response) => {
            this.getUpdatedOrganizationsList()
          })
          .catch((error) => {
            console.log(error)
          })
      }
    },
    components: {
      organizationList
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
