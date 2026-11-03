<script setup>
import Delavec from "./Delavec.vue";
import { ref, onMounted } from "vue";

// Getting the selected business unit id that was sent from PoslovnaEnota.vue to know which groups to fetch
const props = defineProps({
  poslovnaEnotaId: Number
});

// Holds the list of organizational groups for this business unit
const organizacijskeSkupine = ref([]);

// Tracks which group is currently expanded
const selectedGroup = ref(null);

// Getting data from backend
onMounted(async () => {

  const response = await fetch("http://localhost:3000/organizacijske-skupine/" + props.poslovnaEnotaId);

  const data = await response.json();

  organizacijskeSkupine.value = data;
});

// Toggles a group open or closed when clicked
// If the clicked group is already open, closes it; otherwise opens the new one
function prikaziDelavce(organizacijskaSkupina){

  if(selectedGroup.value == organizacijskaSkupina.id){
    selectedGroup.value = null;
  } else {
    selectedGroup.value = organizacijskaSkupina.id;
  }
}

</script>

<template>
 <!-- @click="prikaziDelavce(organizacijskaSkupina)" -->     
  <div class="group-container">

    <div 
      class="group-card"
      v-for="organizacijskaSkupina in organizacijskeSkupine"
      
      @click.stop="prikaziDelavce(organizacijskaSkupina)"
    >

      <h3>
  <span>Organizacijska skupina:</span>
  {{ organizacijskaSkupina.ime }}
</h3>

      <p>{{ organizacijskaSkupina.opis }}</p>
      <!-- show workers for selected group --> 
      <div v-if="selectedGroup == organizacijskaSkupina.id">

        <Delavec :organizacijskaSkupinaId="organizacijskaSkupina.id" />

      </div>

    </div>

  </div>

</template>

<style scoped>

.group-container{
  margin-left: 25px;
  margin-top: 12px;
}

.group-card{
  background-color: #e8e8e8;
  border-left: 5px solid #ff6b57;
  padding: 12px;
  margin-bottom: 10px;
  width: 260px;
  border-radius: 6px;
  cursor: pointer;
}

.group-card h3{
  margin-bottom: 10px;
  color: #333;
}

.group-card h3 span{
  font-size: 13px;
  color: #666;
  font-weight: normal;
  display: block;
} 

.group-card p{
  color: #555;
}

</style>