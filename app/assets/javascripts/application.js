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

$('.app-about').hover(function () {
    $(this).toggleClass('dark-shadow')
})

$('.app-about').click(function () {
    $(location).prop('href', 'https://rhermawan56.github.io/')
})

function animation_about() {
    let a = $('.about-me p')
    let about = a.length - 1
    var b = setInterval(() => {
        $($(a)[about]).addClass('security-none')
        $($(a)[about-1]).addClass('animation-about')

        about--
        if (about < 0) {
            clearInterval(b)
            $('<hr>').insertAfter('.about-me')
            $('.about .content').show()
        }
    }, 1000);
}

function div_about() {
    for (let index = 0; index < 3; index++) {
        $('<div class="p-absolute left"></div>').insertAfter('.about .content .bg-img-2')
        $('<div class="p-absolute right"></div>').insertAfter('.about .content .bg-img-2')
    }

    let a = $('.about .content .left')
    let b = $('.about .content .right')
    let width_index

    for (let index = 0; index < a.length; index++) {
        if (index == 1) {
            // console.log(a[index])
            width_index = (($(a[index]).width()) / 16) - 3
            $(a[index]).css({
                'width' : width_index + "rem",
                'height' : width_index + "rem",
                'left' : '15%'
            })

            $(b[index]).css({
                'width' : width_index + "rem",
                'height' : width_index + "rem",
                'right' : '15%'
            })

        } else if (index == 2) {
            width_index = width_index - 3
            $(a[index]).css({
                'width' : width_index + "rem",
                'height' : width_index + "rem",
                'left' : '5%'
            })

            $(b[index]).css({
                'width' : width_index + "rem",
                'height' : width_index + "rem",
                'right' : '5%'
            })
        }
    }
}

// $('.about-container').scroll(function() {
// 	var height = $('.about-container').scrollTop();
//   if(height > 50) {
// 		console.log(height)
// 	} else {
// 		console.log(height)
// 	}
// });


$(function () {
    setTimeout(function () {
        $('.notice p').hide() 
    }, 2000)

    navbar(title)

    to_hover(title)
    
    navmobile(title)

    animation_about()

    div_about()

})