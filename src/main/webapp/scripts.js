const customerButton = document.getElementById('userLogin');

customerButton.addEventListener("click", () =>{
	const userForm = document.getElementById('test');
	
	if (userForm.style.display == 'block'){
		userForm.style.display = 'none';
	}else{
		userForm.style.display = 'block';
	}
});