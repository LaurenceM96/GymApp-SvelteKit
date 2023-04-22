<script>
    import "../app.css";
</script>

<!-- Profile card -->
<div class="flex items-center">
    <div class="w-16 h-16 rounded-full overflow-hidden bg-dark2 flex flex-col justify-center items-center">
      <div class="w-4 h-4 rounded-full bg-accent1"></div>
      <div class="w-5 h-5 bg-primary1"></div>
    </div>
    <div class="ml-4">
      <h2 class="font-semibold text-2xl text-text1">Laurence</h2>
      <p class="font-light text-text2">Giga chad</p>
    </div>
  </div>
  
  <!-- Leaderboard -->
  <h2 class="pt-12 pb-4 font-semibold text-2xl text-text1">Leaderboard</h2>
  <div class="mb-4 bg-dark2 rounded-br-lg rounded-tr-lg border-l-4 border-primary1 px-4 py-2 flex items-center">
    <div class="w-12 text-2xl font-semibold mr-2 text-text1">1<sup>st</sup></div>
    <div class="border-r border-text1 h-10"></div>
    <div class="flex justify-between w-full ml-4">
      <div class="text-text1 text-xl font-semibold">Laurence</div>
      <div class="text-text1 text-lg">500 points</div>
    </div>
  </div>
  
  <div class="bg-dark2 rounded-br-lg rounded-tr-lg border-l-4 border-primary1 px-4 py-2 flex items-center">
    <div class="w-12 text-2xl font-semibold mr-2 text-text1">2<sup>nd</sup></div>
    <div class="border-r border-text1 h-10"></div>
    <div class="flex justify-between w-full ml-4">
      <div class="text-text1 text-xl font-semibold">Ross</div>
      <div class="text-text1 text-lg">200 points</div>
    </div>
  </div>
  
  <!-- Action buttons/links -->
  <div class="grid grid-cols-2 gap-3 mt-8">
    <a class="bg-dark2 rounded-lg flex items-center justify-between px-4 py-2" href="/">
      <span class="mr-2 text-text1 w-full">Past workouts</span>
      <span class="bg-primary1 text-text1 rounded-full p-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
        </svg>
      </span>
    </a>
    <a class="bg-dark2 rounded-lg flex items-center justify-between px-4 py-2" href="/">
      <span class="mr-2 text-text1 w-full">Progress</span>
      <span class="bg-primary1 text-text1 rounded-full p-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 12H6"/>
        </svg>
      </span>
    </a>
    <a class="bg-dark2 rounded-lg flex items-center justify-between px-4 py-2" href="/">
      <span class="mr-2 text-text1 w-full">Exercises</span>
      <span class="bg-primary1 text-text1 rounded-full p-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
        </svg>
      </span>
    </a>
    <a class="bg-dark2 rounded-lg flex items-center justify-between px-4 py-2" href="/record_workout">
      <span class="mr-2 text-text1 w-full">Record Workout</span>
      <span class="bg-primary1 text-text1 rounded-full p-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
        </svg>
      </span>
    </a>
  </div>
  
  
  <!-- Progress on prev week -->
  <div class="bg-dark2 rounded-lg p-4 flex items-center mt-8">
    <div class="w-8 h-8 bg-green1 rounded-full p-2 mr-4 flex items-center justify-center">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-text1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"/>
      </svg>
    </div>
    <div>
      <p class="font-semibold text-text1">Up 542 points on last week!</p>
    </div>
  </div>