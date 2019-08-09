/**
 * Login.html
 */

function validate(){
	var usern = document.getElementById("username").value;
	var errUsername = document.getElementById("errUsername");
	
	var pass = document.getElementById("password").value;
	var errPassword = document.getElementById("errPassword");
	
	var finalLine = document.getElementById("finalLine");
	
	if(usern.length==0){
		finalLine.innerHTML = "";
		errUsername.innerHTML = "";
		errUsername.innerHTML = "<font color=#e02900>Please enter the username to proceed</font>";
		return false;
	} else if(pass.length==0){
		errUsername.innerHTML = ""; //blank out the username error
		finalLine.innerHTML = "";
		errPassword.innerHTML = "<font color=#e02900>Please enter the password to proceed</font>";
		return false;
	} else {
		errPassword.innerHTML = "";
		errUsername.innerHTML = "";
		if(pass.length<6){
			errUsername.innerHTML = "";
			finalLine.innerHTML = "";
			errPassword.innerHTML = "<font color=#e02900>Password length should not be less than 6 characters</font>";
			return false;
		} else if(usern == "anwesh" && pass == "root123"){
			alert("Login Succesful. Welcome, "+usern);
		} else {
			finalLine.innerHTML = "<font color=#e02900>Login failed. Please enter the correct username and password!</font>";
			return false;
		}
	}
}