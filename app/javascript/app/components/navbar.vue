<template>
  <div id="navbar">
    <h4>Navbar</h4>
    <table>
      <tr>
        <td>
          <img :src="logoImage">
        </td>
        <td>
          <p>{{ current_email }}</p>
        </td>
        <td>
          <a href="/staffs/sign_out" data-method="delete">Log Out</a>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
  export default {
    props: ['current_email', 'logoImage']
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

#navbar {
  border-bottom: 1px solid black;
  border-top: 1px solid black;
}

</style>
