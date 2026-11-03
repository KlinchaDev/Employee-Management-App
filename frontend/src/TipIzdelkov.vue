<script setup>
// import functions from Vue
import { ref, onMounted } from "vue";

// Receives the worker's id to know which product types to fetch
const props = defineProps({
  delavecId: Number,
});

// Holds the list of digital product types assigned to this worker
const tipiIzdelkov = ref([]);

// Getting data from backend
onMounted(async () => {
  const response = await fetch(
    "http://localhost:3000/tipi-izdelkov/" + props.delavecId,
  );

  const data = await response.json();

  tipiIzdelkov.value = data;
});
</script>

<template>
  <div class="product-container">
    <!-- Show a message if the worker has no product types assigned -->
    <p v-if="tipiIzdelkov.length === 0">Ni dodeljenih produktov.</p>

    <div
      class="product-card"
      v-for="tipIzdelka in tipiIzdelkov"
      :key="tipIzdelka.naziv"
    >
      <p>{{ tipIzdelka.naziv }}</p>
      <small>{{ tipIzdelka.opis }}</small>
    </div>
  </div>
</template>

<style scoped>
.product-container {
  margin-top: 12px;
  padding: 12px;
  background-color: white;
  border: 1px solid #999;
  width: 260px;
  border-radius: 6px;
}

.product-card {
  background-color: #f6d7d2;
  padding: 10px;
  margin-bottom: 8px;
  border-left: 5px solid #ff6b57;
}

.product-card p {
  margin: 0;
  font-weight: bold;
}

.product-card small {
  display: block;
  margin-top: 5px;
}
</style>
