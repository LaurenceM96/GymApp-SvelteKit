<script>
    import "../app.css";
    import { clickOutside } from '../utils.js';
    import { scale } from 'svelte/transition';
    
    let showMenu = false;
    let sets = 1;
    let reps = 8;
    let weight;
    let selectedExercise = 'Select exercise';

    let editMode = true;
    
    function toggleMenu() {
      showMenu = !showMenu;
    }
    
    function selectOption(option) {
      selectedExercise = option;
      showMenu = false;
    }

    function incrementSets() {
        sets += 1;
    }

    function decrementSets() {
        if (sets > 1) {
            sets -= 1;
        }
    }

    function incrementReps() {
        reps += 1;
    }

    function decrementReps() {
        if (reps > 1) {
            reps -= 1;
        }
    }

    function toggleEditMode() {
        editMode = !editMode;
    }
</script>

<div class="bg-dark2 rounded-lg text-text1 p-3 mt-8 relative">
    <!-- Exercise selector -->
    <div class="w-full text-text1 text-lg relative inline-block">
        <button 
            class="w-full bg-dark2 rounded-lg px-4 flex items-center justify-between border-text1 touch-manipulation transition-all duration-500" 
            class:border="{editMode}"
            class:py-2="{editMode}"
            class:grow="{!editMode}"
            disabled="{!editMode}"
            on:click={toggleMenu}
        >
            <span 
                class="transition-all duration-500" 
                class:grow="{!editMode}"
                class:mr-2="{editMode}"
            >
                {selectedExercise}
            </span>
            {#if editMode}
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L10 12.586l3.293-3.293a1 1 0 011.414 1.414l-4 4z" clip-rule="evenodd"/>
                </svg>
            {/if}
        </button>
        {#if showMenu}
            <div 
                class="absolute z-10 top-14 left-0 right-0 bg-dark2 rounded-lg py-2 shadow-xl border border-text1" 
                use:clickOutside 
                on:outclick={() => (showMenu = false)}
            >
                <ul class="px-4">
                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                    <li 
                        class="py-2 hover:bg-dark3 cursor-pointer border-b-dark3 border-b" 
                        on:click={() => selectOption('Option 1')}
                    >
                        Option 1
                    </li>
                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                    <li 
                        class="py-2 hover:bg-dark3 cursor-pointer border-b-dark3 border-b" 
                        on:click={() => selectOption('Option 2')}
                    >
                        Option 2
                    </li>
                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                    <li 
                        class="py-2 hover:bg-dark3 cursor-pointer" 
                        on:click={() => selectOption('Option 3')}
                    >
                        Option 3
                    </li>
                </ul>
            </div>
        {/if}
    </div>
    <!-- Set detail input -->
    <div 
        class="flex mt-4 justify-between transition-all duration-500"
        class:mt-4="{editMode}"
        class:mt-1="{!editMode}"
    >
        <!-- Sets input -->
        <div class="flex flex-col items-center w-4/12">
            <p 
                class="text-text2 font-thin transition-all duration-500"
                class:pb-2="{editMode}" 
                class:pb-0="{!editMode}"
            >
                Sets
            </p>
                <button 
                    class="rounded-full bg-primary1 text-text1 p-1 touch-manipulation transition-all duration-500"
                    on:click={incrementSets}
                    class:scale-y-0="{!editMode}"
                    class:max-h-8="{editMode}"
                    class:max-h-0="{!editMode}"
                    class:p-0="{!editMode}"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" class:invisible="{!editMode}" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                    </svg>
                </button>
            <p 
                class="text-2xl transition-all duration-500"
                class:p-2="{editMode}" 
                class:p-0="{!editMode}"
            >
                {sets}
            </p>
            <button 
                class="rounded-full bg-primary1 text-text1 p-1 touch-manipulation transition-all duration-500"
                on:click={decrementSets}
                class:scale-y-0="{!editMode}"
                class:max-h-8="{editMode}"
                class:max-h-0="{!editMode}"
                class:p-0="{!editMode}"
            >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" class:invisible="{!editMode}" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 12H6"/>
                </svg>
            </button>
        </div>
        <!-- Weight input -->
        <div class="flex flex-col items-center w-1/2 relative">
            <span class="transition-all duration-500"
                class:p-3="{editMode}"
                class:p-0="{!editMode}"
            ></span>
            <p class="text-text2 font-thin">Weight</p>
            <input 
                bind:value={weight}
                type="number" 
                inputmode='decimal' 
                class="w-1/2 bg-dark2 rounded-none border-text2 focus:border-primary2 text-center text-4xl focus:outline-none transition-all duration-500"
                class:border-b="{editMode}"
                class:pt-4="{editMode}"
                class:p-0="{!editMode}"
                readonly="{!editMode}"
            >
            <span 
                class="absolute right-4 transition-all duration-500"
                class:top-20="{editMode}"
                class:top-10="{!editMode}"
                class:right-4="{editMode}"
                class:right-7="{!editMode}"
            >
                kg
            </span>
        </div>
        <!-- Reps input -->
        <div class="flex flex-col items-center w-4/12">
            <p 
                class="text-text2 font-thin transition-all duration-500"
                class:pb-2="{editMode}" 
                class:pb-0="{!editMode}"
            >
                Reps
            </p>
            <button 
                class="rounded-full bg-primary1 text-text1 p-1 touch-manipulation transition-all duration-500"
                on:click={incrementReps}
                class:scale-y-0="{!editMode}"
                class:max-h-8="{editMode}"
                class:max-h-0="{!editMode}"
                class:p-0="{!editMode}"
            >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                </svg>
            </button>
            <p 
                class="text-2xl transition-all duration-500"
                class:p-2="{editMode}" 
                class:p-0="{!editMode}"
            >
                {reps}
            </p>
            <button 
                class="rounded-full bg-primary1 text-text1 p-1 touch-manipulation transition-all duration-500"
                on:click={decrementReps}
                class:scale-y-0="{!editMode}"
                class:max-h-8="{editMode}"
                class:max-h-0="{!editMode}"
                class:p-0="{!editMode}"
            >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 12H6"/>
                </svg>
            </button>
        </div>
    </div>
    <!-- Points & finish editing -->
    <div 
        class="flex items-center justify-center mt-6 transition-all duration-500"
        class:mt-6="{editMode}"
        class:mt-2="{!editMode}"
        class:items-center="{!editMode}"
    >
        <!-- {#if !editMode}
            <span class="h-8 w-8"></span>
        {/if} -->
        <p 
            class="text-text1 text-2xl pr-4 transition-all duration-500 text-center"
            class:grow="{!editMode}"
            class:pr-4="{editMode}"
            class:pr-0="{!editMode}"
            class:pl-10="{!editMode}"
        >
            Points: 340
        </p>
        <button 
            class="bg-primary1 text-text1 rounded-full p-1 h-8 w-8"
            on:click={toggleEditMode}
        >
            {#if editMode}
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                </svg>
            {:else}
                <span class="material-symbols-outlined h-6 w-6">
                    edit
                </span>
              
            {/if}
        </button>
    </div>
</div>