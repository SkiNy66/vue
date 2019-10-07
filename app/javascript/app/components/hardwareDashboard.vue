<template lang='pug'>
  div
    h4 Hardware Dashboard
    p(v-if="errors.length")
      b Пожалуйста исправьте указанные ошибки:
      ul
        li(v-for='error in errors') {{ error }}
    .q-pa-md
      .q-gutter-md(style='max-width: 300px')
        q-input(v-model='hardware.title' label='Title')
        q-input(v-model='hardware.kind' label='Kind')
        q-input(v-model='hardware.serial_number' label='S/N')
      b Organization
        q-select(
                filled
                v-model="hardware.organization_id"
                :options="organizationsOptions"
                label="Organizations"
                style="width: 250px"
                emit-value)
    q-btn(push color="primary" @click="postNewHardware" label="Add hardware")
    hardwareList(:hardwaresList="hardwaresList" @updateHardware='postEditHardware', :organizationsOptions='organizationsOptions')
</template>

<script>
  import hardwareList from 'app/components/hardwareList.vue'
  import { getHardwaresList,
           postNewHardware,
           postEditHardware,
           getOrganizationsList
         } from 'app/api/'

  export default {
    data: function () {
      return {
        hardware: {
          title: '',
          kind: '',
          serial_number: '',
          organization_id: ''
        },
        hardwaresList: [],
        errors: [],
        organizationsOptions: []
      }
    },
    created() {
      this.getUpdatedHardwaresList()
      getOrganizationsList()
        .then((response) => {
          this.organizationsOptions = this.makeOrganizationsOptionList(response.data);
        })
        .catch((error) => {
          this.error = true;
        })
        .finally(() => {
          this.loading = false;
        });
    },
    methods: {
      getUpdatedHardwaresList: function() {
        getHardwaresList()
          .then((response) => {
            this.hardwaresList = response.data;
          })
          .catch((error) => {
            this.error = true;
          })
          .finally(() => {
            this.loading = false;
          });
      },
      postNewHardware: function() {
        if (this.checkForm()) {
          postNewHardware(this.hardware)
            .then((response) => {
              this.getUpdatedHardwaresList()
            })
            .catch((error) => {
              console.log(error)
            })
          this.hardware.title = ''
          this.hardware.kind = ''
          this.hardware.serial_number = ''
          this.hardware.organization_id = ''
        }
      },
      postEditHardware: function(hardware) {
          postEditHardware(hardware)
            .then((response) => {
              this.getUpdatedHardwaresList()
            })
            .catch((error) => {
              console.log(error)
            })
      },
      checkForm: function (e) {
        this.errors = [];

        if (!this.errors.length) {
          return true;
        }
      },
      makeOrganizationsOptionList: function(organizations) {
        var options_list = organizations.map(function(h) {
          var test = {}
          test['value'] = h['id']
          test['label'] = h['title']
          return test;
        });

        return options_list
      },
    },
    components: {
      hardwareList
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
