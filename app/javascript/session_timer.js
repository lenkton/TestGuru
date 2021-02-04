var timerStart = new Date().getTime()
var timerEnd

document.addEventListener('turbolinks:load', function(){
  if(!document.getElementById('timer')) return
  timerEnd = timerStart + Number(document.getElementById('timer').dataset.timeTotal)*1000
  setInterval(updateTimer, 1000)
})

function updateTimer(){
  timeLeft = (timerEnd - new Date().getTime()) / 1000

  if(timeLeft < 0){
    window.location.href = window.location.href + "/result"
  }

  document.getElementById('timer-value').innerHTML = Math.floor(timeLeft)
}
