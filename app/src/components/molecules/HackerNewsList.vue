<script setup>
import { ref, onMounted } from 'vue';

const stories = ref([]);

const fetchStories = async () => {
  try {
    const response = await fetch('https://hacker-news.firebaseio.com/v0/topstories.json');
    const storyIds = await response.json();
    const latestStoryIds = storyIds.slice(0, 50);

    const storyPromises = latestStoryIds.map(id => 
      fetch(`https://hacker-news.firebaseio.com/v0/item/${id}.json`).then(res => res.json())
    );

    stories.value = await Promise.all(storyPromises);
  } catch (error) {
    console.error('Error fetching Hacker News', error);
  }
};

onMounted(fetchStories);
</script>

<template>
  <div>
    <h2>Hacker News 最新50件</h2>
    <ul>
      <li v-for="story in stories" :key="story.id">
        <a :href="story.url" target="_blank" rel="noopener noreferrer">{{  story.title  }}</a>
      </li>
    </ul>
  </div>
</template>

<style scoped></style>