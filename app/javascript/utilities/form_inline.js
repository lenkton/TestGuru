document.addEventListener('turbolinks:load', function(){
  var controls = document.querySelectorAll('.form-inline-link')

  if (!controls.length) return

  for (var i = 0; i < controls.length; i++){
    controls[i].addEventListener('click', formInlineLinkHandler)
  }

  var errors = document.getElementById('resource-errors')

  if(errors){
    let resourceId = errors.dataset.resourceId

    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event){
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId){
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId +'"]')
  var testName = document.querySelector('.test-name[data-test-id="' + testId +'"]')
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId +'"]')

  if (formInline.classList.contains('hide')){
    testName.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    testName.classList.remove('hide')
    formInline.classList.add('hide')
    link.textContent = 'Edit'
  }
}
