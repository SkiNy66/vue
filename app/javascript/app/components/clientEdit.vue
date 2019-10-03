<template lang='pug'>
  .d
    q-btn(label='Edit client' color="orange" @click='inception = true')
    q-dialog(v-model='inception')
      q-card
        q-card-section
          .text-h6 Edit client
        q-card-section
          .q-pa-md
            .q-gutter-md(style='max-width: 300px')
              q-input(v-model='selected_client[0].full_name' label='full_name')
              q-input(v-model='selected_client[0].email' label='email')
              q-input(v-model='selected_client[0].phone' label='phone')
          q-btn(push color="primary" @click="clickUpdateButton" label="Update client")
          q-btn(push color="red" @click="clickResetPasswordButton" label="Reset password")
        q-card-actions.text-primary(align='right')
          q-btn(flat='' label='Close' v-close-popup='')
</template>

<script>
  import { postResetPasswordClient } from 'app/api/'

  export default {
    data () {
      return {
        inception: false
      }
    },
    props: ['selected_client'],
    methods:{
      clickUpdateButton: function() {
        this.$emit('update_client_clicked', this.selected_client[0])
      },
      clickResetPasswordButton: function() {
        postResetPasswordClient(this.selected_client[0].id)
      }
    }
  }
</script>