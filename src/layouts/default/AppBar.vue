<template>
  <img src="@/assets/kita-famfest-black.png" :style="logoStyle" />
</template>

<script lang="ts" setup>
import type { CSSProperties } from 'vue';

const logoStyle: CSSProperties = {
  position: 'absolute',
  top: '0',
  right: '0',
  padding: '1em',
  zIndex: '9999 !important',
  width: '90px',
  height: '106px',
};

</script>
