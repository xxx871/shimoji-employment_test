<script setup>
import ProfileInfo from '../molecules/ProfileInfo.vue';
import avatar from '@/assets/images/avatar.png';

const emit = defineEmits(['aboutClick', 'hackerNewsClick']);

const handleAboutClick = () => {
  emit('aboutClick');
};

const handleHackerNewsClick = () => {
  emit('hackerNewsClick');
};
</script>

<template>
  <aside class="sidebar">
    <p>サイドメニュー</p>
    <ProfileInfo :src="avatar"/>
    <nav class="menu">
      <ul>
        <li><button @click="handleAboutClick">About</button></li>
        <li><button @click="handleHackerNewsClick">Hacker News</button></li>
      </ul>
    </nav>
  </aside>
</template>

<style scoped>
.sidebar {
  border: 2px solid gray;
  border-radius: 10px;
  width: 20%;
}

.sidebar p {
  margin: 5px 0px 0px 5px;
}

.menu {
  margin-top: 20px;
}

.menu ul {
  list-style-type: none;
  margin-left: 20px;
  padding-left: 0px;
}

.menu li {
  margin-bottom: 10px;
}

.menu button {
  background: none;
  border: none;
  font: inherit;
}

.menu button:hover {
  text-decoration: underline;
}
</style>