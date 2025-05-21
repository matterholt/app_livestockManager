<script setup lang="ts">
import { ref } from 'vue'

const animalTag = ref<string[]>([]) // fetch animal tag from API, should be a list
</script>

<template>
  <form>
    <label>Animal Tag </label>
  </form>
</template>
<style>
form {
  margin: 50px;
  outline: solid;
  height: 250px;
}
</style>
