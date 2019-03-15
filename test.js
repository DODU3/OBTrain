.pragma library

function func(code) {
    'use strict';
//    var code = '(function(){ return this; }())';

//    var result = eval.call( null, code );
    console.log( eval(code) ); // true sloppy mode
}
