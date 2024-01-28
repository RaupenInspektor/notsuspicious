function sendLogin(){
    fetch("/getDataTemplate").then(ctx => {
      loginData = ctx.json();
      var mail = document.querySelector('#mail').value;
      var password = document.querySelector('#password').value;
      loginData.mail = mail;
      loginData.password = password;
      fetch('/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(loginData)
        })
  })
}