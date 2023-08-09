<template>
  <v-img aspect-ratio="1:2" width="20%" height="10%" class="mt-3" src="@/assets/kita-famfest-black.png" :style="logoStyle" />
</template>

<script lang="ts" setup>
import type { CSSProperties } from 'vue';

const logoStyle: CSSProperties = {
  position: 'absolute',
  top: '0',
  right: '0',
  padding: '1em',
  zIndex: '9999 !important',
  // width: '100px',
  // height: '200px',
};

</script>
