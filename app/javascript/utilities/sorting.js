document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  
  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle(){
  var table = document.querySelector('table')

  var rows = table.querySelector('tbody').querySelectorAll('tr')
  var sortedRows = []

  for (var i = 0; i < rows.length; i++){
    sortedRows.push(rows[i])
  }

  if(this.querySelector('.octicon-arrow-up').classList.contains('hide')){
    sortedRows.sort(compareRowsAscending)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDescending)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTBody = document.createElement('tbody')

  for (var i = 0; i < sortedRows.length; i++){
    sortedTBody.appendChild(sortedRows[i])
  }

  table.replaceChild(sortedTBody, table.querySelector('tbody'))
}

function compareRowsAscending(row1, row2){
  var title1 = row1.querySelector('td').textContent
  var title2 = row2.querySelector('td').textContent
  
  if (title1 > title2) return 1
  if (title1 < title2) return -1
  return 0
}

function compareRowsDescending(row1, row2){
  return compareRowsAscending(row2, row1)
}
