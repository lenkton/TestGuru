var timerStart = new Date().getTime()
var timerEnd
var timerStop = false

document.addEventListener('turbolinks:load', function(){
  if(!document.getElementById('timer')) return
  timerEnd = timerStart + Number(document.getElementById('timer').dataset.timeTotal)*1000
  setInterval(updateTimer, 1000)
})

function updateTimer(){
  if (timerStop) return

  timeLeft = (timerEnd - new Date().getTime()) / 1000

  if(timeLeft < 0){
    timerStop = true
    document.getElementById('form').submit()
  }

  document.getElementById('timer-value').innerHTML = Math.floor(timeLeft)
}
