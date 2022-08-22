$('#top-close').click(function () {
    $(location).prop('href','/home')
})

$(function () {
    setTimeout(function () {
        $('.notice p').hide()
    }, 2000)
})