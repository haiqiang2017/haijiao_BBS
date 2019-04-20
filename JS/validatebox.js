 $(function(){  
    $.extend($.fn.validatebox.defaults.rules, {  
        CHS: {  
            validator: function (value) {  
                alert('CHS');
                return /^[\u0391-\uFFE5]+$/.test(value);  
            },  
            message: 'The input Chinese characters only.'  
        },  
        Mobile: {
            validator: function (value) {  
                var reg = /^1[3|4|5|8|9]\d{9}$/;  
                return reg.test(value);  
            },  
            message: 'Please enter your mobile phone number correct.'  
        },  
        ZipCode: {  
            validator: function (value) {  
                var reg = /^[0-9]\d{5}$/;  
                return reg.test(value);  
            },  
            message: 'The zip code must be 6 digits and 0 began.'  
        },  
        Number: {  
            validator: function (value) {  
                var reg =/^[0-9]*$/;  
                return reg.test(value);  
            },  
            message: 'Please input number.'  
        } 
    });  
}