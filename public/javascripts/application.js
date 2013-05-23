// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function verify_passcode(user_id) {
    apprise('Enter Your Passcode', {'input':true}, function(r) {
        if (r) {
        $.ajax({
            url: '/verify/' + user_id + "/" + r ,
            method: 'post',
            success: function(data){
                if (data.success) {
                    window.location = "/edit_user?id="+user_id
                } else {
                    wrong_passcode_error(user_id);
                }
            }
        });
        }
    });
}

function wrong_passcode_error(user_id) {
   apprise('Wrong Passcode. Want to try again?', {'verify':true}, function(r) {
     if (r) {
       verify_passcode(user_id);
     }
   });
}