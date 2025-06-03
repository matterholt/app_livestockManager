import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

const sampleData = [
  {
    id: 100,
    tag_id: 'black-001',
    nick_name: 'Copper',
    gender: 'male',
    birth_date: '2022-03-08',
    birth_father_id: 0,
    birth_mother_id: 0,
    breed_id: 1,
  },
  {
    id: 200,
    tag_id: 'black-002',
    nick_name: 'Timmy',
    gender: 'male',
    birth_date: '2022-03-08',
    birth_father_id: 0,
    birth_mother_id: 0,
    breed_id: 1,
  },
  {
    id: 2,
    tag_id: 'blue-001',
    nick_name: 'penny',
    gender: 'female',
    birth_date: '2022-04-04',
    birth_father_id: 0,
    birth_mother_id: 1,
    breed_id: 1,
  },
  {
    id: 1,
    tag_id: 'blue-001a',
    nick_name: 'April',
    gender: 'female',
    birth_date: '2022-05-04',
    birth_father_id: 0,
    birth_mother_id: 1,
    breed_id: 1,
  },
]
export const useLivestockStore = defineStore('livestock', () => {
  const savedLivestock = ref(sampleData)

  const dataStoreKeys = computed(() => {
    const niceTitle = new Map([
      ['id', '#'],
      ['tag_id', 'Tag Name'],
      ['nick_name', 'Nick Name'],
      ['gender', 'Gender'],
      ['birth_date', 'Birth Date'],
      ['birth_father_id', 'Father'],
      ['birth_mother_id', 'Mother'],
      ['breed_id', 'Breed'],
    ])

    return Object.keys(savedLivestock.value[0]).map((x) => niceTitle.get(x))
  })
  //   return { count, doubleCount, increment }
  return { savedLivestock, dataStoreKeys }
})
