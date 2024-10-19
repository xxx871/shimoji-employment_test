<script setup>
import { ref } from 'vue';
import GitHubIcon from '@/assets/icons/GitHub.svg';
import XIcon from '@/assets/icons/X.svg';
import LinkedInIcon from '@/assets/icons/LinkedIn.svg';
import FaceBookIcon from '@/assets/icons/FaceBook.svg';
import LineIcon from '@/assets/icons/Line.svg';
import MixiIcon from '@/assets/icons/Mixi.svg';
import SocialIcon from '../atoms/SocialIcon.vue';

const icons = ref([
  { name: 'GitHub', href: 'https://github.com/xxx871', src: GitHubIcon },
  { name: 'X', href: 'https://x.com/?lang=ja', src: XIcon },
  { name: 'LinkedIn', href: 'https://jp.linkedin.com', src: LinkedInIcon },
  { name: 'FaceBook', href: 'https://www.facebook.com/?locale=ja_JP', src: FaceBookIcon },
  { name: 'Line', href: 'https://line.me/ja/', src: LineIcon },
  { name: 'Mixi', href: 'https://mixi.jp/', src: MixiIcon }
]);
</script>

<template>
  <div class="social-icons">
    <SocialIcon
      v-for="icon in icons"
      :key="icon.name"
      :href="icon.href"
      :icon-src="icon.src"
      :name="icon.name"
    />
  </div>
</template>

<style scoped>
.social-icons {
  display: flex;
  gap: 5px;
  margin-right: 10px;
}
</style>