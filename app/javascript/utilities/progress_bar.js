document.addEventListener('turbolinks:load', function(){
  var progressBar = document.getElementById('my-progress-bar')
  
  if (progressBar) markProgress(progressBar)
})

function markProgress(progressBar){
  questionNumber = document.getElementById('question').dataset.questionNumber
  Array
    .from(progressBar.querySelectorAll('.progress-cell'))
    .filter((elem) => elem.dataset.questionNumber < questionNumber)
    .forEach((elem) => elem.style.backgroundColor = 'green')
}
