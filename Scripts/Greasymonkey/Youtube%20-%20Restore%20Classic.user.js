// ==UserScript==
// @name         Youtube - Restore Classic
// @version      1.0.2
// @description  If youtube is in the new 2017 YouTube Material Redesign, automatically restore classic view
// @author       Cpt_mathix
// @match        https://www.youtube.com
// @include      https://www.youtube.com/*
// @license      GPL version 2 or any later version; http://www.gnu.org/licenses/gpl-2.0.txt
// @namespace    https://greasyfork.org/users/16080
// @run-at       document-start
// @grant        none
// @noframes
// ==/UserScript==

(function () {
    replaceCookie("PREF");

    function replaceCookie(name) {
        if (document.cookie) {
            var match = document.cookie.match(RegExp('(?:^|;\\s*)' + name + '=([^;]*)'));
            if (match && match[1]) {
                match = match[1];
                console.log("current PREF cookie: " + match);
                if (match.search(/f6=(8|9)(&|;)/) === -1) {
                    if (match.search(/f6=.+(&|;)/) === -1) {
                        document.cookie = "PREF=" + match + "&f6=8" + ";path=/;domain=.youtube.com";
                    } else if (match.search(/f6=.+(&|;)/) !== -1) {
                        document.cookie = "PREF=" + match.replace(/f6=.+(&|;)/, 'f6=8&') + ";path=/;domain=.youtube.com";
                    }
                    location.reload();
                }
            } else {
                console.log("PREF cookie not found");
            }
        } else {
            console.log("document.cookie not supported for your browser or you do not allow cookies at all");
        }
    }
})();