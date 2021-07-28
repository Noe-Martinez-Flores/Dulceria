

const recuperarContraseña = () => {
        let user = document.getElementById("UsuarioRecup").value
        let mail = document.getElementById("mailRecup").value
        alert(` ${user} se ha enviado un correo con el codigo de recuperacion favor de revisar su bandeja de entrada `)

}

const validar = () => {
    let user = document.getElementById("UsuarioLogin").value
    let pass = document.getElementById("PassLogin").value
    if (user == 'admin') {
            var win = window.open("WEB-INF/screens/adminInicio.html", '_blank')
            win.focus()
            alert(`Bienvenido ${user}, usuario y contraseña correctos`)
    } else if (user == 'cajero'){
            var win2 = window.open("WEB-INF/screens/cajeroInicio.html", '_blank')
            win2.focus()
            win2.
            alert(`Bienvenido ${user}, usuario y contraseña correctos`)
    }else{
            alert(` usuario y contraseña incorrectos`)
    }
};
const bienv =()  => {
        let user = document.getElementById("UsuarioLogin").value
        return user;
};
var miMedia 
miMedia = bienv() 
document.write (miMedia)