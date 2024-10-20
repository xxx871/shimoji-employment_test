<script setup>
import { ref, watch, onMounted } from 'vue';

const isDarkMode = ref(true);

const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value;
  updateTheme();
};

const updateTheme = () => {
  if (isDarkMode.value) {
    document.documentElement.removeAttribute('data-theme');
  } else {
    document.documentElement.setAttribute('data-theme', 'light');
  }
  localStorage.setItem('theme', isDarkMode.value ? 'dark' : 'light');
};

const getSystemPreference = () => {
  return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
};

onMounted(() => {
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme) {
    isDarkMode.value = savedTheme === 'dark';
  } else {
    isDarkMode.value = getSystemPreference();
  }
  updateTheme();
});

watch(() => isDarkMode.value, updateTheme);
</script>

<template>
  <label class="toggle-button">
    <input type="checkbox" @change="toggleTheme" :checked="isDarkMode">
  </label>
</template>

<style scoped>
.toggle-button {
    display: inline-block;
    position: relative;
    width: 50px;
    height: 25px;
    border-radius: 50px;
    background-color: #dddddd;
    cursor: pointer;
    transition: background-color .4s;
}

.toggle-button:has(:checked) {
    background-color: #4bd865;
}

.toggle-button::after {
    position: absolute;
    top: 0;
    left: 0;
    width: 25px;
    height: 25px;
    border-radius: 50%;
    box-shadow: 0 0 5px rgb(0 0 0 / 20%);
    background-color: #fff;
    content: '';
    transition: left .4s;
}

.toggle-button:has(:checked)::after {
    left: 25px;
}

.toggle-button input {
    display: none;
}
</style>