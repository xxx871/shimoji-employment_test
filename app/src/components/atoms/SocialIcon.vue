<script setup>
const props = defineProps({
  href: { type: String, required: true },
  iconSrc: { type: String, required: true },
  name: { type: String, required: true }
});
</script>

<template>
  <a :href="href" target="_blank" rel="noopener noreferrer">
    <img :src="iconSrc" :alt="name" class="icon">
  </a>
</template>

<style scoped>
a {
  width: 24px;
  height: 24px;
  text-decoration: none;
}

a:hover {
  opacity: 0.8px;
}

.icon {
  width: 24px;
  height: 24px;
}
</style>