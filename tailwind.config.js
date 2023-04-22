/** @type {import('tailwindcss').Config} */
export default {
  content: [".src/app.html", "./src/**/*.{html,js,svelte}"],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      'primary1': '#2563eb',
      'primary2': '#598EF3',
      'primary3': '#D3E6FE',
      'accent1': '#d946ef',
      'accent2': '#fae8ff',
      'green1': '#48A14D',
      'text1': '#cbd5e1',
      'text2': '#94a3b8',
      'dark1': '#1e293b',
      'dark2': '#334155',
      'dark3': '#475569'
    },
    extend: {
      fontFamily: {
        'poppins': ['Poppins', 'sans-serif']
      },
    },
  },
  plugins: [],
}

