<template lang='pug'>
  div(id="organizationList" class="q-pa-md")
    q-table(title="Organizations" :data="organizationsList" :columns="columns" row-key="id" dark color="amber" selection="single"
      :selected.sync="selected")
    div(v-if="(this.selected.length > 0)")
      organizationEdit(:selected_organization='selected' @update_organization_clicked='updateOrganization')
      q-btn(push color="red" @click="deleteOrganization" label="Remove organization")
</template>

<script>
  import organizationEdit from 'app/components/organizationEdit.vue'

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
      },
      updateOrganization: function(organization) {
        this.$emit('updateOrganization', organization)
      }
    },
    components: {
      organizationEdit
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
