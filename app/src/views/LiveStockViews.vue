<script setup lang="ts">
import { ref } from 'vue'
import { useLivestockStore } from '@/stores/livestock'

const livestockStore = useLivestockStore()
const tableHeading = livestockStore.dataStoreKeys
</script>

<template>
  <div>
    <h1>Animals on farm</h1>
    <div class="heading row_layout">
      <p v-for="(item, idx) in tableHeading" :key="idx">{{ item }}</p>
      <p>link</p>
    </div>
    <div
      class="heading row_layout"
      v-for="livestock in livestockStore.savedLivestock"
      :key="livestock.id"
    >
      <p v-for="(value, key) in livestock" :key="key" :class="`row_item-${key}`">{{ value }}</p>
      <div>
        <a herf="/">details</a>
      </div>
    </div>
  </div>
</template>

<style>
.heading {
  display: flex;
  justify-content: space-between;
}

.row_layout {
  display: grid;
  grid-template-columns: 50px 1fr 1fr 108px 123px 50px 50px 50px 50px;
}
</style>
