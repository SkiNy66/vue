<template>
  <div id="clientList">
    <table>
      <tr>
        <td>
          <p>{{ full_name }}</p>
        </td>
        <td>
          <p>{{ email }}</p>
        </td>
        <td>
          <p>{{ phone }}</p>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
  export default {
    props: ['full_name', 'email', 'phone']
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
