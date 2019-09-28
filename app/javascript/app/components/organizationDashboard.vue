<template lang='pug'>
  div
    h4 Organizations Dashboard
    p(v-if="errors.length")
      b Пожалуйста исправьте указанные ошибки:
      ul
        <li v-for="error in errors">{{ error }}</li>
    <label><input type="text" name="" value="" v-model="title">Title</label>
    br
    <label><input type="text" name="" value="" v-model="kind">kind</label>
    br
    <label><input type="text" name="" value="" v-model="iin">iin</label>
    br
    <label><input type="text" name="" value="" v-model="ogrn">ogrn</label>
    br
    q-btn(push color="primary" @click="postNewOrganization" label="Add organization")
    organizationList(:organizationsList="organizationsList", @deleteOrganization="deleteOrganization")
</template>

<script>
  import organizationList from 'app/components/organizationList.vue'

  export default {
    data: function () {
      return {
        title: '',
        kind: '',
        iin: '',
        ogrn: '',
        errors: []
      }
    },
    props: ['organizationsList'],
    methods: {
      postNewOrganization: function() {
        if (this.checkForm()) {
          this.$emit('postNewOrganization', {title: this.title, kind: this.kind, iin: this.iin, ogrn: this.ogrn} )
          this.title = ''
          this.kind = ''
          this.iin = ''
          this.ogrn = ''
        }
      },
      checkForm: function (e) {
        this.errors = [];

        if (this.title.length < 1) {
          this.errors.push('Title не должен быть пустым');
        }
        if (this.kind.length < 1) {
          this.errors.push('kind не должен быть пустым');
        }
        if (this.iin.length < 1) {
          this.errors.push('iin не должен быть пустым');
        }
        if (this.ogrn.length < 1) {
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
