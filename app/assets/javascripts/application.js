$('#top-close').click(function () {
    $(location).prop('href','/home')
})

$('#svg').click(function () {
    $('.media-mobile').toggleClass('to-media')
    $('.media-mobile a').toggleClass('to-show')
    $('.media-mobile span').toggleClass('to-show')
})

$(function () {
    setTimeout(function () {
        $('.notice p').hide()
    }, 2000)
})