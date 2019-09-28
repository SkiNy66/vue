<template lang='pug'>
  q-header(elevated class="bg-primary text-white")
    q-toolbar
      q-toolbar-title
        q-avatar
          img(:src="logoImage")
        | Staff Navbar
      p {{ current_email }}
      a(href='/staffs/sign_out' data-method='delete') Log Out
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
