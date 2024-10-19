<script setup>
import { ref, onMounted } from 'vue';
import Footer from '../organisms/Footer.vue';
import Header from '../organisms/Header.vue';
import MainContent from '../organisms/MainContent.vue';
import Sidebar from '../organisms/Sidebar.vue';
import HackerNewsList from '../molecules/HackerNewsList.vue';

const markdownContent = ref('');

const loadMarkdown = async () => {
  try {
    const response = await import('../../assets/markdown/about.md');
    markdownContent.value = response.default;
  } catch (error) {
    console.error('Error loading markdown content', error);
    markdownContent.value = 'Error loading content.';
  }
};

const handleAboutClick = () => {
  loadMarkdown();
};

onMounted(() => {
  loadMarkdown();
});

const showHackerNews = ref(false);

const handleHackerNewsClick = () => {
  showHackerNews.value = true;
  markdownContent.value = '';
};
</script>

<template>
  <div class="layout">
    <Sidebar @about-click="handleAboutClick" @hacker-news-click="handleHackerNewsClick" />
    <div class="main-wrapper">
      <Header />
      <MainContent :markdownContent="markdownContent">
        <HackerNewsList v-if="showHackerNews" />
      </MainContent>
    </div>
  </div>
  <Footer />
</template>

<style scoped>
.layout {
  display: flex;
  gap: 10px;
  min-height: 85vh;
  margin-bottom: 10px;
}

.main-wrapper {
  width: 80%;
}
</style>