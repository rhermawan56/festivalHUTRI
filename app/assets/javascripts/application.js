$('#top-close').click(function () {
    $(location).prop('href','/home')
})

$('#svg').click(function () {
    $('.media-mobile').toggleClass('to-media')
    $('.media-mobile a').toggleClass('to-show')
    $('.media-mobile span').toggleClass('to-show')
})

// $('.r-1 .div span').click(function () {
//     const check = $('.r-1 .div span')
//     const checkActive = $(check).hasClass('active')
//     if (true) {
//         $(check).removeClass('active')
//         $(this).toggleClass('active')
//     }
// })

$(function () {
    setTimeout(function () {
        $('.notice p').hide()
    }, 2000)
})