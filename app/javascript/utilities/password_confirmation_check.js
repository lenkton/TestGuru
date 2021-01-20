document.addEventListener('turbolinks:load', function(){
  var control = document.getElementById('user_password_confirmation')
  if (control) control.addEventListener('input', checkConfirmation)
})

function checkConfirmation(){
  const originalField = document.getElementById('user_password')
  errorMark = document.getElementById('error-mark')
  successMark = document.getElementById('success-mark')

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
