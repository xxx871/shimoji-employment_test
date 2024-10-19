<script setup>
import { ref, onMounted, watch } from 'vue';
import { marked } from 'marked';

const props = defineProps({
  markdownContent: { type: String, required: true }
});

const htmlContent = ref('');

const renderMarkdown = () => {
  htmlContent.value = marked(props.markdownContent);
};

onMounted(renderMarkdown);
watch(() => props.markdownContent, renderMarkdown);
</script>

<template>
  <div v-html="htmlContent"></div>
</template>

<style scoped></style>