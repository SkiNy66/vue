<template lang='pug'>
  .d
    q-btn(label='Edit staff' color="orange" @click='inception = true')
    q-dialog(v-model='inception')
      q-card
        q-card-section
          .text-h6 Edit staff
        q-card-section
          .q-pa-md
            .q-gutter-md(style='max-width: 300px')
              q-input(v-model='selected_staff[0].email' label='email')
          q-btn(push color="primary" @click="clickUpdateButton" label="Update staff")
          q-btn(push color="red" @click="clickResetPasswordButton" label="Reset password")
        q-card-actions.text-primary(align='right')
          q-btn(flat='' label='Close' v-close-popup='')
</template>

<script>
  import { postResetPasswordStaff } from 'app/api/'

  export default {
    data () {
      return {
        inception: false
      }
    },
    props: ['selected_staff'],
    methods:{
      clickUpdateButton: function() {
        this.$emit('update_staff_clicked', this.selected_staff[0])
      },
      clickResetPasswordButton: function() {
        postResetPasswordStaff(this.selected_staff[0].id)
      }
    }
  }
</script>