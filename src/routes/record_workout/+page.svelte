<script>
    import "../../app.css";
    import Exercise from "../../components/Exercise.svelte";
    import { clickOutside } from '../../utils.js';
    
    let showMenu = false;
    let selectedMuscleGroup = 'Select muscle group';
    
    function toggleMenu() {
      showMenu = !showMenu;
    }
    
    function selectOption(option) {
      selectedMuscleGroup = option;
      showMenu = false;
    }
</script>

<div class="flex items-center">
  <a class="flex items-center text-text1 text-xl rounded-lg py-2 px-4 mr-4" href="/">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
    </svg>
    <span>Back</span>
  </a>
</div>

<h2 class="mt-6 pb-4 font-semibold text-2xl text-text1">Muscle group</h2>
<div class="w-full text-text1 text-lg relative inline-block">
  <button class="w-full bg-dark2 rounded-lg px-4 py-2 flex items-center justify-between touch-manipulation" on:click={toggleMenu}>
    <span class="mr-2">{selectedMuscleGroup}</span>
    <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M10.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L10 12.586l3.293-3.293a1 1 0 011.414 1.414l-4 4z" clip-rule="evenodd"/>
    </svg>
  </button>
  {#if showMenu}
    <div 
      class="absolute z-10 top-14 left-0 right-0 bg-dark2 rounded-lg py-2 shadow-xl" 
      use:clickOutside on:outclick={() => (showMenu = false)}
    >
      <ul class="px-4">
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <li class="py-2 hover:bg-dark3 cursor-pointer border-b-dark3 border-b" on:click={() => selectOption('Option 1')}>Option 1</li>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <li class="py-2 hover:bg-dark3 cursor-pointer border-b-dark3 border-b" on:click={() => selectOption('Option 2')}>Option 2</li>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <li class="py-2 hover:bg-dark3 cursor-pointer" on:click={() => selectOption('Option 3')}>Option 3</li>
      </ul>
    </div>
  {/if}
</div>

<Exercise/>