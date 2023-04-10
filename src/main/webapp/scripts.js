const customerButton = document.getElementById('userLogin');

customerButton.addEventListener("click", () =>{
	const userForm = document.getElementById('test');
	
	if (userForm.style.display == 'block'){
		userForm.style.display = 'none';
	}else{
		userForm.style.display = 'block';
	}
});

n =  new Date();
y = n.getFullYear();
m = n.getMonth() + 1;
d = n.getDate();

document.getElementById("date").innerHTML = y + "-" + m + "-" + d;