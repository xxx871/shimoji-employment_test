<script setup>
const props = defineProps({
  src: { type: String, required: true },
  alt: { type: String, default: 'avatar' }
});
</script>

<template>
  <div class="avatar">
    <img v-bind="$attrs" :src="src" :alt="alt">
  </div>
</template>

<style scoped>
.avatar {
  width: 170px;
  height: 170px;
  border-radius: 50%;
  overflow: hidden;
  border: 2px solid gray;
  margin-top: 10px;
}

.avatar img {
  width: 110%;
  height: 110%;
  margin: -5%;
  object-fit: cover;
  object-position: center;
}
</style>