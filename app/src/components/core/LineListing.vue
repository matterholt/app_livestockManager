<script setup lang="ts">
import type { LivestockEvents } from '@/someTypes/livestockEvents'
defineProps<{
  events: LivestockEvents[]
}>()
</script>

<template>
  <ul>
    <li class="listHeading">
      <p class="event_index">0</p>
      <p v-for="x in Object.keys(events[0])" :class="x" :key="x">{{ x.split('_').join(' ') }}</p>
    </li>

    <li class="list_items" v-for="(event, indx) in events" :key="event.animal_tag">
      <p class="event_index">{{ indx + 1 }}</p>
      <p class="animal_tag">
        {{ event.animal_tag }}
      </p>
      <p class="event_type">{{ event.event_type }}</p>
      <p class="note_length">{{ event.note.length }}</p>
      <p class="entry_date">{{ event.entry_date }}</p>
    </li>
  </ul>
</template>
<style>
.listHeading {
  border-bottom: 1px solid white;
  margin: 5px 0px;
  font-weight: 900;
  font-size: 1.1rem;
  text-transform: capitalize;
}
li {
  width: 550px;
  display: grid;
  grid-template-columns: 25px 1fr 1fr 1fr;
  grid-template-areas: 'line animalTag eventType date theNote ';
}
.list_items {
  transition: all 2s ease-in-out;
  opacity: 1;
  transform: translateY(0);
  @starting-style {
    opacity: 0;
    transform: translateY(50%);
  }
}
.event_index {
  grid-area: line;
}
.animal_tag {
  grid-area: animalTag;
}
.event_type {
  grid-area: eventType;
}
.note_length {
  grid-area: theNote;
}
.entry_date {
  grid-area: date;
}
</style>
