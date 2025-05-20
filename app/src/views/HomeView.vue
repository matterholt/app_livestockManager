<script setup lang="ts">
import { ref } from 'vue'
const events = ref(null)
fetch('http://127.0.0.1:8000/sheep/event/')
  .then((response) => response.json())
  .then((data) => (events.value = data))
</script>

<template>
  <main>
    <div v-if="events">
      <ul>
        <li v-for="event in events">{{ event }} test</li>
      </ul>
    </div>
  </main>
</template>
