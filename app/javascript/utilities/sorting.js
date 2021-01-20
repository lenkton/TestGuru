document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  
  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle(){
  var table = document.querySelector('table')

  isAscending = this.querySelector('.octicon-arrow-up').classList.contains('hide')

  if(isAscending){
    arrowUp(this)
  } else {
    arrowDown(this)
  }

  replaceTBody(
    table,
    Array
      .from(table.querySelector('tbody').rows)
      .sort((rowA, rowB) =>
        // the logic mess below is an implementation of a xor operator
        (rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? isAscending : !isAscending) ? 1 : -1
      )
  )
}

function replaceTBody(table, rows){
  var newTBody = document.createElement('tbody')

  for (var i = 0; i < rows.length; i++){
    newTBody.appendChild(rows[i])
  }

  table.replaceChild(newTBody, table.querySelector('tbody'))
}

function arrowUp(parentElem){
  parentElem.querySelector('.octicon-arrow-up').classList.remove('hide')
  parentElem.querySelector('.octicon-arrow-down').classList.add('hide')
}

function arrowDown(parentElem){
  parentElem.querySelector('.octicon-arrow-up').classList.add('hide')
  parentElem.querySelector('.octicon-arrow-down').classList.remove('hide')
}
