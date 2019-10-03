<template lang='pug'>
  div(id="clientList" class="q-pa-md")
    q-table(title="Clients" :data="clientsList" :columns="columns" row-key="id" dark color="amber" selection="single"
      :selected.sync="selected")
    div(v-if="(this.selected.length > 0)")
      clientEdit(:selected_client='selected' @update_client_clicked='updateClient')
</template>

<script>
  import clientEdit from 'app/components/clientEdit.vue'

  export default {
    props: ['clientsList'],
    data () {
      return {
        columns: [
          { name: 'id', label: 'ID', field: 'id' },
          { name: 'full_name', align: 'left', label: 'Full name', field: 'full_name', sortable: true },
          { name: 'email', label: 'e-mail', field: 'email', sortable: true },
          { name: 'phone', label: 'Phone', field: 'phone' },
        ],
        selected: []
      }
    },
    methods:{
      updateClient: function(client) {
        this.$emit('updateClient', client)
      }
    },
    components: {
      clientEdit
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
