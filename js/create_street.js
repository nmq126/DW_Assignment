$(document).ready(function () {
    //load quận từ server
    loadData();
    //validate form
    $("form[name=street-form]").validate({
        rules: {
            name: "required",
            district_id: "required",
            description: "required",
            created_at: "required",
            status: "required"
        },
        messages: {
            name: "Vui lòng nhập vào tên đường",
            district_id: "Vui lòng chọn quận",
            description: "Vui lòng nhập mô tả",
            created_at: "Vui lòng nhập ngày thành lập",
            status: "Vui lòng chọn trạng thái",
        },
        submitHandler: function () {
            submitData();
            window.location.replace('http://localhost/street_manager/client/list.html');
        }
    });

})

function submitData() {
    $(".submit-text").hide();
    $(".spinner-border").show();
    let inputName = $('input[name=name]');
    let inputDistrict = $('select[name=district_id]');
    let inputCreatedAt = $('input[name=created_at]');
    let inputDescription = $('textarea[name=description]');
    let inputStatus = $('select[name=status]');

    let data = {
        name: inputName.val(),
        district_id: inputDistrict.val(),
        created_at: inputCreatedAt.val(),
        description: inputDescription.val(),
        status: inputStatus.val()
    }
    $.ajax({
        url: 'http://localhost/street_manager/server/store_street.php',
        method: 'POST',
        data: JSON.stringify(data),
        success: function (responseData) {
            alert(responseData.message);
            loadData();
        },
        error: function () {
            alert('Something is wrong')
        }
    })

}

function loadData() {
    $.ajax({
        url: 'http://localhost/street_manager/server/list_district.php',
        method: 'GET',
        success: function (data) {
            var contentHTML = `<option value="" disabled selected>---Chọn quận---</option>`;
            data.forEach(element => {
                contentHTML += `<option value="${element.id}"> ${element.name} </option>`
            });
            $('#district').html(contentHTML);
        },
        error: function () {
            alert('Data ')
        }
    })
}

