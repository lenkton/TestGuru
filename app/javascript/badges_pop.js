document.addEventListener('turbolinks:load', function(){
  var showButton = document.getElementById('show-badges-button')
  var hideButton = document.getElementById('hide-badges-button')
  
  if (showButton && hideButton) {
    showButton.addEventListener('click', showBadges)
    hideButton.addEventListener('click', hideBadges)
  }
})

function showBadges(){
  pop = document.getElementById('badges-pop')
  var showButton = document.getElementById('show-badges-button')
  var hideButton = document.getElementById('hide-badges-button')

  pop.classList.remove('hide')
  hideButton.classList.remove('hide')
  showButton.classList.add('hide')
}

function hideBadges(button, pop){
  pop = document.getElementById('badges-pop')
  var showButton = document.getElementById('show-badges-button')
  var hideButton = document.getElementById('hide-badges-button')

  pop.classList.add('hide')
  hideButton.classList.add('hide')
  showButton.classList.remove('hide')
}
