/*
 *  *  all.js
 *   *
 *    *  Created By: William Grove
 *     *  For the Global Honors Program at
 *      *  Lock Haven University of Pennsylvania
 *       *
 *        *  Created On: 5/16/2016
 *         *
 *          */

function openNav() {
    document.getElementById("mySidenav").style.width = "50%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

function sticky_relocate() {
    const navBar = $('#navbar');
    const stickyAnchor = $('#sticky-anchor');

    const window_top = $(window).scrollTop();
    const div_top = stickyAnchor.offset().top;

    if (window_top > div_top) {
        stickyAnchor.height(navBar.height());
        navBar.addClass('sticky');
    } else {
        stickyAnchor.height(0);
        navBar.removeClass('sticky');
    }
}

$(function() {
    $(window).scroll(sticky_relocate);
    sticky_relocate();
});

function acceptLogout() {
        var conf = confirm("Are you sure you want to Log Out?");
        return conf;
}


