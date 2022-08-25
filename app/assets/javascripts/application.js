$('#top-close').click(function () {
    $(location).prop('href', '/home')
})

$('#svg').click(function () {
    $('.media-mobile').toggleClass('to-media')
    $('.media-mobile a').toggleClass('to-show')
    $('.media-mobile span').toggleClass('to-show')
})

const title = $('title').html()

function to_hover(title) {    
    const param = $('#nav-link a')
    for (let index = 0; index < param.length; index++) {
        let paramindex = $('#nav-link a')[index]
        $(paramindex).hover(function () {
            let paramcheck = $(this).hasClass(title)
            if (paramcheck == false) {
                $(this).toggleClass('hover-text')
                $($('#nav-link a div')[index]).toggleClass('actives')
            }
        })
    }
}


function navbar(params) {
    let thisnavbar = $('#nav-link a')
    for (let index = 0; index < thisnavbar.length; index++) {
        let thisnavbartext = ($($(thisnavbar)[index]).html()).substring(0, ($($(thisnavbar)[index]).html()).indexOf(' ') - 1)
        if (params == thisnavbartext) {
            $($(thisnavbar)[index]).css('color','#da181f')
            break
        }
    }
}

function navmobile(title) {
    const param = $('.media-mobile a')
    for (let index = 0; index < param.length; index++) {
        let paramindex = $($(param)[index]).html()

        if (paramindex != title) {
            $($(param)[index]).hover(function () {
                $(this).toggleClass('actives')
            })
        }
    }
}


$(function () {
    setTimeout(function () {
        $('.notice p').hide()
    }, 2000)

    navbar(title)

    to_hover(title)
    
    navmobile(title)

})