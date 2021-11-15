$(document).ready(function () {
    //load từ server
    loadDistrict()
    loadStreet();
    $("select[name=district_id]").change(function () {
        let data = {
            keyword: $("input[name=keyword]").val(),
            district_id: $('select[name=district_id]').val()
        }
        loadStreet(data);
    })
    $("input[name=keyword]").keyup(function () {
        let data = {
            keyword: $("input[name=keyword]").val(),
            district_id: $('select[name=district_id]').val()
        }
        loadStreet(data);
    })
})

function loadStreet(data) {
    $.ajax({
        url: 'http://localhost/street_manager/server/list_street.php',
        method: 'GET',
        data: data,
        success: function (data) {
            var contentHTML;
            var status;
            data.forEach(element => {
                if (`${element.status}` == 1) status = 'Đang sử dụng';
                else if (`${element.status}` == 2) status = 'Đang thi công';
                else status = 'Đang tu sửa';
                contentHTML += `<tr>`
                contentHTML += `<th> ${element.street_name} </th>`
                contentHTML += `<th>` + status + `</th>`
                contentHTML += `<th> ${element.district_name} </th>`
                contentHTML += `<th> ${element.created_at} </th>`
                contentHTML += `<th> ${element.description} </th>`
                contentHTML += `</tr>`
            });
            $('#item').html(contentHTML);
        },
        error: function () {
            $('#item').html(`<tr><td colspan="5">Không có kết quả phù hợp</td></tr>`);
        }
    })
}

function loadDistrict() {
    $.ajax({
        url: 'http://localhost/street_manager/server/list_district.php',
        method: 'GET',
        success: function (data) {
            var contentHTML = `<option value=""selected>---Tất cả các quận---</option>`;
            data.forEach(element => {
                contentHTML += `<option value="${element.id}"> ${element.name} </option>`
            });
            $('#district').html(contentHTML);
        },
        error: function () {
        }
    })
}