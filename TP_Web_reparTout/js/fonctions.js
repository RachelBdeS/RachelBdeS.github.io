// FONCTIONS APPELLEES
function showSpan(id) 
{
  let e = document.getElementById(id);
                                  
  if(e.style.display == 'none') 
  {
    e.style.display = 'inline';
    document.querySelector('button.edit').innerHTML = '-';
  } 
  else {
    e.style.display = 'none';
    document.querySelector('button.edit').innerHTML = '+';
  }
}