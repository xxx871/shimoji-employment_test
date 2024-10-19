<script setup>

import SocialIconGroup from '../molecules/SocialIconGroup.vue';

</script>

<template>
  <header>
    <p>ヘッダー</p>
    <div class="header-actions">
      <SocialIconGroup />
    </div>
  </header>
</template>

<style scope>
header {
  border: 2px solid gray;
  height: 50px;
  border-radius: 10px;
  margin-bottom: 10px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

header p {
  margin-right: auto;
  margin-top: 0px;
  margin-left: 5px;
}
</style>