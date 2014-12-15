"use strict";

rs.menu = function(){

    var self = this;

    this.model = function(){
        this.html = {};
        this.html.root = $('#menu');
        this.html.level0 = this.html.root.find('.b-menu__level0 > li');
        this.html.level1 = this.html.level0.children('ul');
    };

    this.bind = function(){
        this.html.level0.on('mouseenter touchstart', function(){
            self.open($(this));
        });

        this.html.root.on('mouseleave touchleave', function(){
            self.closeAll();
        });
    };

    this.events = function(){

    };

    this.open = function(o){
        this.closeAll();
        o.addClass('-current');
        o.children('ul').show().addClass('-opened');
    };

    this.closeAll = function(){
      this.html.level0.removeClass('-current');
      this.html.level1.hide().removeClass('-opened');
    };

    this.init = function(){

        this.model();
        this.bind();
        this.events();

    };

    this.init();
};