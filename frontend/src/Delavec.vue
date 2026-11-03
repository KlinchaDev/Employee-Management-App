<script setup>
import TipIzdelkov from "./TipIzdelkov.vue";
import { ref, onMounted } from "vue";

// Getting the group's id to know which workers to fetch
const props = defineProps({
  organizacijskaSkupinaId: Number,
});

// Holds the list of workers for this organizational group
const delavci = ref([]);

// Tracks which worker is currently open
const selectedDelavec = ref(null);

// Getting data from backend
onMounted(async () => {
  const response = await fetch(
    "http://localhost:3000/delavci/" + props.organizacijskaSkupinaId,
  );

  const data = await response.json();

  delavci.value = data;
});

// Opens the product type popup for the clicked worker
// If the same worker is clicked again it closes the popup
function prikaziDelavca(delavec) {
  if (selectedDelavec.value == delavec.id) {
    selectedDelavec.value = null;
  } else {
    selectedDelavec.value = delavec.id;
  }
}

// Closes the popup
function zapriOkno() {
  selectedDelavec.value = null;
}
</script>

<template>
  <div class="worker-container">
    <!-- @click.stop on the inner box prevents closing when clicking inside it -->
    <div
      class="worker-card"
      v-for="delavec in delavci"
      @click.stop="prikaziDelavca(delavec)"
    >
      <h3>
        <span>Delavec:</span>
        {{ delavec.ime }} {{ delavec.priimek }}
      </h3>

      <p>
        <span>Email:</span>
        {{ delavec.email }}
      </p>

      <p>
        <span>Stopnja izkusenj:</span>
        {{ delavec.stopnja_izkusenj }}
      </p>

      <div v-if="selectedDelavec == delavec.id" class="popup">
        <div class="popup-okno" @click.stop>
          <button @click="zapriOkno()">Zapri</button>

          <h3>Tipi digitalnih produktov</h3>
          <!-- Passes the worker's id so TipIzdelkov fetches the right products -->
          <TipIzdelkov :delavecId="delavec.id" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.worker-container {
  margin-left: 20px;
  margin-top: 10px;
}

.worker-card {
  background-color: #dfefff;
  border-left: 5px solid #4d8cff;
  padding: 10px;
  margin-bottom: 8px;
  width: 230px;
  border-radius: 6px;
  cursor: pointer;
}
.worker-card h3 {
  margin-bottom: 10px;
  color: #333;
}
.worker-card h3 span {
  font-size: 13px;
  color: #555;
  font-weight: normal;
  display: block;
}

.worker-card p {
  margin: 4px 0;
}

.worker-card p span {
  display: block;
  font-size: 13px;
  color: #666;
}

.popup {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.3);
}

.popup-okno {
  background-color: white;
  width: 350px;
  padding: 20px;
  margin: 100px auto;
  border: 1px solid gray;
  border-radius: 6px;
}
</style>
