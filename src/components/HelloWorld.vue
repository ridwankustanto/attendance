<template>
  <v-container class="fill-height">
    <v-responsive class="align-center text-center fill-height">
      <v-row class="d-flex align-center justify-center">
        <v-col cols="12">
          <v-img class="mx-auto" width="495" src="@/assets/figure-family.png" />
        </v-col>
        <v-col cols="12">
          <h1 class="text-h4 font-weight-bold py-4" :style="textKamuAdalahStyle">Kamu adalah...</h1>
        </v-col>
      </v-row>

      <v-row class="d-flex align-center justify-center">
        <v-col cols="6">
          <v-btn :style="buttonRoundStyle" class="text-white" color="#A37BBD" height="85" min-width="164" width="100%"
            rel="noopener noreferrer" variant="flat" :disabled="disabled" :loading="loading_ayah" @click="submit('ayah')">
            Ayah
          </v-btn>
        </v-col>
        <v-col cols="6">
          <v-btn :style="buttonRoundStyle" class="text-white" color="#FBB216" height="85" min-width="164" width="100%"
            rel="noopener noreferrer" target="_blank" variant="flat" :disabled="disabled" :loading="loading_ibu"
            @click="submit('ibu')">
            Ibu
          </v-btn>
        </v-col>
      </v-row>

      <v-row class="d-flex align-center justify-center">
        <v-col cols="6">
          <v-btn :style="buttonRoundStyle" class="text-white" color="#F0562B" height="85" min-width="164" width="100%"
            rel="noopener noreferrer" target="_blank" variant="flat" :disabled="disabled" :loading="loading_calon_ayah"
            @click="submit('calon_ayah')">
            Calon Ayah
          </v-btn>
        </v-col>
        <v-col cols="6">
          <v-btn :style="buttonRoundStyle" class="text-white" color="#CCDB29" height="85" min-width="164" width="100%"
            rel="noopener noreferrer" target="_blank" variant="flat" :disabled="disabled" :loading="loading_calon_ibu"
            @click="submit('calon_ibu')">
            Calon Ibu
          </v-btn>
        </v-col>
      </v-row>

      <v-row class="d-flex align-center justify-center">
        <v-col cols="12">
          <v-btn :style="buttonRoundStyle" class="text-white" color="#518FFE" height="85" min-width="345" width="100%"
            rel="noopener noreferrer" target="_blank" variant="flat" :disabled="disabled" :loading="loading_anak"
            @click="submit('anak')">
            Anak
          </v-btn>
        </v-col>
      </v-row>

      <v-dialog v-model="dialog" width="auto">
        <v-card class="mx-auto" elevation="16" height="300" color="#CDDC2B" rounded>
          <v-card-item>
            <v-img width="300" src="@/assets/dialog-kita-famfest.png" />
          </v-card-item>
          <v-card-text>
            <v-row class="d-flex align-center justify-center">
              <div class="text-h6 my-4">
                Terima kasih!
              </div>
              Selamat datang
              di KITA Fam Fest 🥳
            </v-row>
          </v-card-text>
          <!-- <v-card-actions>
            <v-btn variant="text" class="text-black" block @click="dialog = false">OK</v-btn>
          </v-card-actions> -->
        </v-card>
      </v-dialog>

    </v-responsive>
  </v-container>
</template>

<script lang="ts" setup>
import { CSSProperties, ref } from 'vue';

// Variables
const props = defineProps({
  dialog: Boolean,
  disabled: Boolean,
  loading_ayah: Boolean,
  loading_ibu: Boolean,
  loading_calon_ayah: Boolean,
  loading_calon_ibu: Boolean,
  loading_anak: Boolean
})

const dialog = ref(props.dialog)
const disabled = ref(props.disabled)
const loading_ayah = ref(props.loading_ayah)
const loading_ibu = ref(props.loading_ibu)
const loading_calon_ayah = ref(props.loading_calon_ayah)
const loading_calon_ibu = ref(props.loading_calon_ibu)
const loading_anak = ref(props.loading_anak)

// Method
async function submit(role: string): Promise<void> {
  console.log(role)


  switch (role) {
    case 'ayah':
      loading_ayah.value = true
      break;
    case 'ibu':
      loading_ibu.value = true
      break;
    case 'calon_ayah':
      loading_calon_ayah.value = true
      break;
    case 'calon_ibu':
      loading_calon_ibu.value = true
      break;
    case 'anak':
      loading_anak.value = true
      break;

    default:
      break;
  }
  disabled.value = true

  // Post data
  const url = '/api/items/attendance_list'
  const data = {
    role: role
  }

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer BuRYT2tpEIBytXUzolcR8bHoCNJKF8y-'
      },
      body: JSON.stringify(data)
    })

    if (response.ok) {
      dialog.value = true
      console.log('Data posted successfully')
      setTimeout(() => {
        loading_ayah.value = false
        dialog.value = false
        disabled.value = false

        loading_ayah.value = false
        loading_ibu.value = false
        loading_calon_ayah.value = false
        loading_calon_ibu.value = false
        loading_anak.value = false

      }, 1500);
    } else {
      alert("Ups, mohon dicoba kembali ya 🙏")
      loading_ayah.value = false
      dialog.value = false
      disabled.value = false

      loading_ayah.value = false
      loading_ibu.value = false
      loading_calon_ayah.value = false
      loading_calon_ibu.value = false
      loading_anak.value = false
      console.error('Failed to post data:', response.statusText)
    }
  } catch (error) {
    alert("Ups, mohon dicoba kembali ya 🙏")
    loading_ayah.value = false
    dialog.value = false
    disabled.value = false

    loading_ayah.value = false
    loading_ibu.value = false
    loading_calon_ayah.value = false
    loading_calon_ibu.value = false
    loading_anak.value = false
    console.error('An error occurred:', error)
  }
}

// CSS Property
const buttonRoundStyle: CSSProperties = {
  borderRadius: '25px',
}

const textKamuAdalahStyle: CSSProperties = {
  paddingTop: '0 !important',
  color: '#444444'
}

</script>


<style scoped>
.v-card--rounded {
  border-radius: 25px !important;
}
</style>