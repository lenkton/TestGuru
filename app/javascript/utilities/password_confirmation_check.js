document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.password-confirmation-check')
  if (control) control.addEventListener('input', checkConfirmation)

  var control1 = document.querySelector('.password-confirmation-password')
  if (control1) control1.addEventListener('input', checkConfirmation)
})

function checkConfirmation(){
  original_field = document.querySelector('.password-confirmation-password')
  confirmation_field = document.querySelector('.password-confirmation-check')

  if(confirmation_field.value == ""){
    document.querySelector('.error-mark').classList.add('hide')
    document.querySelector('.success-mark').classList.add('hide')
    return
  }

  if(original_field.value == confirmation_field.value){
    document.querySelector('.error-mark').classList.add('hide')
    document.querySelector('.success-mark').classList.remove('hide')
  } else {
    document.querySelector('.error-mark').classList.remove('hide')
    document.querySelector('.success-mark').classList.add('hide')
  }
}
