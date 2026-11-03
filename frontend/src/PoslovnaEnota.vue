<script setup>
import OrganizacijskaSkupina from "./OrganizacijskaSkupina.vue";
import { ref, onMounted } from "vue";

// Holds the list of all business units fetched from the backend
const poslovneEnote = ref([]);

// Tracks which business unit is currently expanded
const selectedUnit = ref(null);

// Getting data from backend
onMounted(async () => {
  const response = await fetch("http://localhost:3000/poslovna-enota");

  const data = await response.json();

  poslovneEnote.value = data;
});

// Toggles a business unit open or closed when clicked
// If the clicked unit is already open it closes it, otherwise opens the new one
function prikaziSkupine(poslovnaEnota) {
  if (selectedUnit.value == poslovnaEnota.id) {
    selectedUnit.value = null;
  } else {
    selectedUnit.value = poslovnaEnota.id;
  }
}
</script>

<template>
  <div class="container">
    <h1 class="title">Organizacijska struktura delavcev</h1>

    <div
      class="card"
      v-for="poslovnaEnota in poslovneEnote"
      @click="prikaziSkupine(poslovnaEnota)"
    >
      <h2>
        <span>Poslovna enota:</span>
        {{ poslovnaEnota.ime }}
      </h2>

      <p>Mesto: {{ poslovnaEnota.mesto }}</p>

      <p>Drzava: {{ poslovnaEnota.drzava }}</p>
      <!-- show groups for selected unit -->
      <div v-if="selectedUnit == poslovnaEnota.id">
        <OrganizacijskaSkupina :poslovnaEnotaId="poslovnaEnota.id" />
      </div>
    </div>
  </div>
</template>

<style scoped>
* {
  font-family: Arial, sans-serif;
}

.container {
  padding: 40px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

.title {
  background-color: #6f6f6f;
  color: white;
  text-align: center;
  padding: 18px;
  margin-bottom: 35px;
  border-radius: 6px;
}

.card {
  background-color: white;
  border-left: 6px solid #ff6b57;
  padding: 18px;
  margin-bottom: 18px;
  width: 390px;
  cursor: pointer;
  border-radius: 8px;
}

.card:hover {
  transform: scale(1.02);
  background-color: #fafafa;
}

.card h2 span {
  font-size: 15px;
  color: #666;
  font-weight: normal;
  display: block;
  margin-bottom: 4px;
}

.card h2 {
  font-size: 22px;
  color: #222;
}
.card p {
  color: #555;
  margin: 5px 0;
}
</style>
