document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.password-confirmation-check')
  if (control) control.addEventListener('input', checkConfirmation)
})

function checkConfirmation(){
  const originalField = this.parentElement.parentElement.querySelector('.password-confirmation-password')
  errorMark = this.parentElement.querySelector('.error-mark')
  successMark = this.parentElement.querySelector('.success-mark')

  if(this.value == ""){
    errorMark.classList.add('hide')
    successMark.classList.add('hide')
    return
  }

  if(originalField.value == this.value){
    errorMark.classList.add('hide')
    successMark.classList.remove('hide')
  } else {
    errorMark.classList.remove('hide')
    successMark.classList.add('hide')
  }
}
