<script setup lang="ts">
import type { LivestockEvents } from '@/someTypes/livestockEvents'

import LineListing from '@/components/core/LineListing.vue'
import EventListForm from '@/components/core/eventListForm.vue'

import { ref } from 'vue'
const events = ref<LivestockEvents[] | null>(null)
fetch('http://127.0.0.1:8000/sheep/event/')
  .then((response) => response.json())
  .then((data) => (events.value = data))
</script>

<template>
  <main>
    <div v-if="events">
      <LineListing :events="events" />
    </div>
    <div v-else>
      <p class="no_data">Reload</p>
    </div>
    <EventListForm />
  </main>
</template>
<style>
.no_data {
  color: red;
}
</style>
