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
    organizationList(:organizationsList="organizationsList", @deleteOrganization="deleteOrganization")
</template>

<script>
  import organizationList from 'app/components/organizationList.vue'

  export default {
    data: function () {
      return {
        organization: {
          title: '',
          kind: '',
          iin: '',
          ogrn: ''
        },
        errors: []
      }
    },
    props: ['organizationsList'],
    methods: {
      postNewOrganization: function() {
        if (this.checkForm()) {
          this.$emit('postNewOrganization', {title: this.organization.title, kind: this.organization.kind, iin: this.organization.iin, ogrn: this.organization.ogrn} )
          this.organization.title = ''
          this.organization.kind = ''
          this.organization.iin = ''
          this.organization.ogrn = ''
        }
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
      deleteOrganization: function(org_id) {
        this.$emit('deleteOrganization', org_id )
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
