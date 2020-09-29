const nav = document.getElementById('nav');
const icon = document.getElementById('icon');

icon.addEventListener('click', e => {
  if (nav.classList.contains('responsive')) {
    nav.classList = '';
  } else {
    nav.classList += 'responsive';
  }

  console.log(nav.classList);
});