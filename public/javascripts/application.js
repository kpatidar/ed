function post_comment(url,show)
{
  var comment_message = $('photo_comment_text').value; // document.forms["login_form"]["login"].value
  if(comment_message == '')
  {
    alert("Comment should not blank");
    return false;
  }
  var state= document.getElementById(show).style.display;
  new Ajax.Request(url,
    { 
      method:'post' ,
      parameters: { comment_name: comment_message},
      onSuccess: function(response) 
      {
	var last_comment = response.responseText ;
        var old_comments = $("all_comment_content").innerHTML;
        $('photo_comment_text').value = '';
        $("all_comment_content").innerHTML = old_comments + last_comment;
      }
    }
  );
  document.getElementById(show).style.display = 'block';
  if (state=='block')
    {
       document.getElementById(show).style.display = 'none'; 
    }
}
function show_comment(show)
{
  var state= document.getElementById(show).style.display;
  document.getElementById(show).style.display = 'block';    
  if (state=='block')
  {
    document.getElementById(show).style.display = 'none'; 
  }
}
 var upload_number = 2;
 function addFileInput() 
   {
     var d = document.createElement("div");
     var file = document.createElement("input");
     file.setAttribute("type", "file");
     file.setAttribute("name", "photo[image][]");
     d.appendChild(file);
     document.getElementById("moreUploads").appendChild(d);
     upload_number++;
   }
 function validate_email()
 {
   var x=document.forms.user.mail.value;
   var atpos=x.indexOf("@");
   var dotpos=x.lastIndexOf(".");
   if(x=="")
   {
    alert("Email id should not be blank");
    return false;
   }
   if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
   {
     alert("Not a valid e-mail address");
     return false;
   }
 }

