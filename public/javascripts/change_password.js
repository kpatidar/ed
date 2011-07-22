function validateForm()
  {
   var current_password = document.forms["change_password_form"]["current_password"].value
   var new_password = document.forms["change_password_form"]["new_password"].value
   var con_password = document.forms["change_password_form"]["con_password"].value
   if (current_password==null || current_password=="" )
    {
      alert("Current_password must be filled out");
      return false;
    }
     if(new_password==null || new_password=="")
      {
        alert("New password must be filled out");
        return false;
      }
    if(con_password==null || con_password=="")
     {
      alert("Confirmed password must be filled out");
      return false;
     }
    if(new_password != con_password)
    {
      alert("New password and Confirmed password must be same");
      return false;
    }
    return true;
  }
