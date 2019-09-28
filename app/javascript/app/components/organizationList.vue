<template lang='pug'>
  div(id="clientList" class="q-pa-md")
    q-table(title="Organizations" :data="organizationsList" :columns="columns" row-key="id" dark color="amber" selection="single"
      :selected.sync="selected")
    q-btn(push color="red" @click="deleteOrganization" label="Remove organization")
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
        ],
        selected: []
      }
    },
    methods:{
      deleteOrganization: function() {
        this.$emit('deleteOrganization', this.selected[0].id )
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
