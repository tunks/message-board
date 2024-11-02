// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
console.log("loading#####")

//import "@hotwired/turbo-rails"
import React from 'react'
import { createRoot } from 'react-dom/client';
import Dropdown from './components/menus/dropdown';

console.log("loading#####2 ......")
document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('user_menu_dropdown');
    if(container){
      const root = createRoot(container);
      root.render(<Dropdown />)
    }
    console.log("loading#####2 ......")

})