<template lang='pug'>
  div(id="staffList" class="q-pa-md")
    q-table(title="staffs" :data="staffsList" :columns="columns" row-key="id" dark color="amber" selection="single"
      :selected.sync="selected")
    div(v-if="(this.selected.length > 0)")
      staffEdit(:selected_staff='selected' @update_staff_clicked='updateStaff')
</template>

<script>
  import staffEdit from 'app/components/staffEdit.vue'

  export default {
    props: ['staffsList'],
    data () {
      return {
        columns: [
          { name: 'id', label: 'ID', field: 'id' },
          { name: 'email', label: 'e-mail', field: 'email', sortable: true }
        ],
        selected: []
      }
    },
    methods:{
      updateStaff: function(staff) {
        this.$emit('updateStaff', staff)
      }
    },
    components: {
      staffEdit
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
