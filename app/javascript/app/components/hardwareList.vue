<template lang='pug'>
  div(id="hardwareList" class="q-pa-md")
    q-table(title="Hardware" :data="hardwaresList" :columns="columns" row-key="id" dark color="amber" selection="single"
      :selected.sync="selected")
    div(v-if="(this.selected.length > 0)")
      hardwareEdit(:selected_hardware='selected' @update_hardware_clicked='updateHardware', :organizationsOptions='organizationsOptions')
</template>

<script>
  import hardwareEdit from 'app/components/hardwareEdit.vue'

  export default {
    props: ['hardwaresList', 'organizationsOptions'],
    data () {
      return {
        columns: [
          { name: 'id', label: 'ID', field: 'id' },
          { name: 'title', align: 'left', label: 'Title', field: 'title', sortable: true },
          { name: 'kind', label: 'Kind', field: 'kind', sortable: true },
          { name: 'serial_number', label: 'S/N', field: 'serial_number' },
          { name: 'organization_id', label: 'Organization id', field: 'organization_id' }
        ],
        selected: []
      }
    },
    methods:{
      updateHardware: function(hardware) {
        this.$emit('updateHardware', hardware)
      }
    },
    components: {
      hardwareEdit
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
