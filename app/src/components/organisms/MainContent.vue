<script setup>
import MarkdownRender from '../molecules/MarkdownRender.vue';

const props = defineProps({
  markdownContent: { type: String, default: '' }
});
</script>

<template>
  <main class="main-content">
    <p>メイン</p>
    <MarkdownRender v-if="markdownContent" :markdownContent="markdownContent" />
    <slot v-else></slot>
  </main>
</template>

<style scoped>
.main-content {
  border: 2px solid gray;
  border-radius: 10px;
  min-height: 75vh;
}

.main-content p {
  margin: 5px 0px 0px 5px;
}
</style>