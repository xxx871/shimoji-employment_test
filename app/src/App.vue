<script setup>
import avatar from './assets/images/avatar.png'
</script>

<template>
  <div class="layout">
    <aside class="sidebar">
      <p>サイドメニュー</p>
      <section class="profile">
        <div class="avatar">
          <img :src="avatar" alt="Profile Avatar">
        </div>
        <h2>Your Name</h2>
        <p>役職名</p>
      </section>
    </aside>
    <div class="main-wrapper">
      <header>
        <p>ヘッダー</p>
      </header>
      <main class="main-content">
        <p>メイン</p>
      </main>
    </div>
  </div>
  <footer>
    <p>フッター</p>
  </footer>
</template>

<style scoped></style>
