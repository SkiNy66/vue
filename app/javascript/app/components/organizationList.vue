<template lang='pug'>
  div(id="clientList" class="q-pa-md")
    q-table(title="Organizations" :data="organizationsList" :columns="columns" row-key="id" dark color="amber" @click.native="deleteOrganization(row)")
</template>

<script>
  export default {
    props: ['organizationsList'],
    data () {
      return {
        columns: [
          { name: 'id', label: 'ID', field: 'id' },
          { name: 'title', align: 'left', label: 'TITLE', field: 'title', sortable: true },
          { name: 'kind', label: 'KIND', field: 'kind', sortable: true },
          { name: 'iin', label: 'IIN', field: 'iin' },
          { name: 'ogrn', label: 'OGRN', field: 'ogrn' }
        ]
      }
    },
    methods:{
      deleteOrganization: function(org_id) {
        this.$emit('deleteOrganization', {id: org_id} )
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
