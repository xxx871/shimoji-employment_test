<script setup>

import Avatar from '../atoms/Avatar.vue';

const props = defineProps({
  src: { type:String, required: true },
})
</script>

<template>
  <div class="profile">
    <Avatar :src="src" />
    <h2>Your Name</h2>
    <p>役職名</p>
  </div>
</template>

<style scoped>
.profile {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.profile h2 {
  margin-top: 10px;
  margin-bottom: 0px;
  font-weight: normal;
}

.profile p {
  padding: 0px;
  margin: 0px;
}
</style>