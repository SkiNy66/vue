<template lang='pug'>
  .d
    q-btn(label='Edit hardware' color="orange" @click='inception = true')
    q-dialog(v-model='inception')
      q-card
        q-card-section
          .text-h6 Edit hardware
        q-card-section
          .q-pa-md
            .q-gutter-md(style='max-width: 300px')
              q-input(v-model='selected_hardware[0].title' label='title')
              q-input(v-model='selected_hardware[0].kind' label='kind')
              q-input(v-model='selected_hardware[0].serial_number' label='serial_number')
              q-select(
                filled
                v-model="selected_hardware[0].organization_id"
                :options="organizationsOptions"
                label="Organizations"
                style="width: 250px"
                emit-value)
          q-btn(push color="primary" @click="clickUpdateButton" label="Update hardware")
        q-card-actions.text-primary(align='right')
          q-btn(flat='' label='Close' v-close-popup='')
</template>

<script>

  export default {
    data () {
      return {
        inception: false
      }
    },
    props: ['selected_hardware', 'organizationsOptions'],
    methods:{
      clickUpdateButton: function() {
        this.$emit('update_hardware_clicked', this.selected_hardware[0])
      }
    }
  }
</script>