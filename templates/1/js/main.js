//Detect high res displays (Retina, HiDPI, etc...)
$(function() {
    Modernizr.addTest('highresdisplay', function () {
        if (window.matchMedia) {
            var mq = window.matchMedia("only screen and (-moz-min-device-pixel-ratio: 1.3), only screen and (-o-min-device-pixel-ratio: 2.6/2), only screen and (-webkit-min-device-pixel-ratio: 1.3), only screen  and (min-device-pixel-ratio: 1.3), only screen and (min-resolution: 1.3dppx)");
            if (mq && mq.matches) {
                $('html').addClass('x2');
                return true;
            }
        }
    });
});