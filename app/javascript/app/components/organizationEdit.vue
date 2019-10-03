<template lang='pug'>
  .d
    q-btn(label='Edit organization' color="orange" @click='inception = true')
    q-dialog(v-model='inception')
      q-card
        q-card-section
          .text-h6 Edit organization
        q-card-section
          .q-pa-md
            .q-gutter-md(style='max-width: 300px')
              q-input(v-model='selected_organization[0].title' label='title')
              q-input(v-model='selected_organization[0].kind' label='kind')
              q-input(v-model='selected_organization[0].iin' label='iin')
              q-input(v-model='selected_organization[0].ogrn' label='ogrn')
              q-select(
                filled
                v-model="selected_organization[0].hardware_id"
                :options="hardwareOptions"
                label="Hardware"
                style="width: 250px"
                emit-value)
          q-btn(push color="primary" @click="clickUpdateButton" label="Update organization")
        q-card-actions.text-primary(align='right')
          q-btn(flat='' label='Close' v-close-popup='')
</template>

<script>
  import { postResetPasswordOrganization } from 'app/api/'

  export default {
    data () {
      return {
        inception: false
      }
    },
    props: ['selected_organization', 'hardwareOptions'],
    methods:{
      clickUpdateButton: function() {
        this.$emit('update_organization_clicked', this.selected_organization[0])
      }
    }
  }
</script>