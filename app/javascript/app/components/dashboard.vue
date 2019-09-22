<template>
  <div id="dashboard">
    <h4>Dashboard</h4>
      <p v-if="errors.length">
        <b>Пожалуйста исправьте указанные ошибки:</b>
        <ul>
          <li v-for="error in errors">{{ error }}</li>
        </ul>
      </p>
      <label><input type="text" name="" value="" v-model="full_name">Full name</label>
      <br>
      <label><input type="number" name="" value="" v-model="phone">Phone</label>
      <br>
      <label><input type="text" name="" value="" v-model="email">email</label>
      <br>
      <button @click="addNewClient">Add client</button>
    <clientList :email="client.email" :full_name="client.full_name" :phone="client.phone" :key="client.id" v-for="client in list"></clientList>
  </div>
</template>

<script>
  import clientList from 'app/components/clientList.vue'

  export default {
    data: function () {
      return {
        full_name: '',
        phone: '',
        email: '',
        errors: []
      }
    },
    props: ['list'],
    methods: {
      addNewClient: function() {
        if (this.checkForm()) {
          this.$emit('addNewClient', {full_name: this.full_name, phone: this.phone, email: this.email} )
          this.full_name = ''
          this.phone = ''
          this.email = ''
        }
      },
      checkForm: function (e) {
        this.errors = [];

        if (this.full_name.length < 5) {
          this.errors.push('Имя должно быть больше 4 символов');
        }
        if (this.phone.length != 10) {
          this.errors.push('Проверьте написание телефона, должно быть 10 символов');
        }
        
        if (!this.email) {
          this.errors.push('Укажите электронную почту.');
        } else if (!this.validEmail(this.email)) {
          this.errors.push('Укажите корректный адрес электронной почты.');
        }

        if (!this.errors.length) {
          return true;
        }
      },
      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      }
    },
    components: {
      clientList
    },
    created() {
      // console.log(list)
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
