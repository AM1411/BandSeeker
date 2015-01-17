/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('input[type="radio"]').click(function () {
        if ($(this).attr("value") == "band") {
            $("#musician-type").hide();
        }
        if ($(this).attr("value") == "musician") {
            $("#musician-type").show();
        }
    });
});
