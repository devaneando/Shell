// ==UserScript==
// @name           eZ Service Desk UserScript
// @version        1.3
// @namespace      https://jira.ez.no/servicedesk
// @description    eZ Service Desk UserScript
// @include        https://jira.ez.no/servicedesk/agent/CS/*
// @include        https://jira.ez.no/browse/CS*
// @include		   https://jira.ez.no/servicedesk/agent/CS/queues/*/CS-*
// @require        https://code.jquery.com/jquery-2.1.4.js
// @require        https://gist.github.com/raw/2625891/waitForKeyElements.js
// @grant          none
// ==/UserScript==

// This is needed to prevent conflicts between webpage and GM's jquery
this.$ = this.jQuery = jQuery.noConflict( true );

var signature = {
	name: "Eduardo Fernandes",
	position: "Product Support Engineer",
	headline: "eZ Platform Enterprise Edition v1.7 is now available, Easier to Build a Solid Content Business.",
	url: "[ez.no/Products/eZ-Platform-Enterprise-Edition|http://ez.no/Products/eZ-Platform-Enterprise-Edition]",
	color: "gray",
	hruler: "__________________________________________________"
};

// extend with setCursorPosition() func, (allows moving carrot to top)
$.fn.setCursorPosition = function ( pos ) {
	this.each( function ( index, elem ) {
		if ( elem.setSelectionRange ) {
			elem.setSelectionRange( pos, pos );
		} else if ( elem.createTextRange ) {
			var range = elem.createTextRange();
			range.collapse( true );
			range.moveEnd( 'character', pos );
			range.moveStart( 'character', pos );
			range.select();
		}
	} );
	return this;
};

// Fulfill the reporter name
function getReporter() {

	//Gets reporter name
	var reporter = $( "#reporter-val" ).text().trim();
	if ( reporter.indexOf( "@" ) >= 0 ) {
		reporter = reporter.substring( 0, reporter.indexOf( "@" ) );
		reporter = reporter.trim();
	}

	var noDear = [
        "Eduardo Fernandes",
        "Inviqa Support",
		"Notification 07 Web",
        "Open Wide",
		"Projet Swisslifebanque",
        "Support Ezpublish",
		"Support Kaliop",
		"Vangen Plotz"
	];

	for ( i = 0; i < noDear.length; i++ ) {
		if ( noDear[i].toLowerCase() === reporter.toLowerCase() ) {
			return "Greetings,\n\n";
		}
	}
	return "Dear " + reporter + ",\n\n";

}

// pre-fill signature when clicking to add a new comment.
function prefillSignature() {
	var input = $( '.sd-comment-textarea' );

	if ( input.val() == "" ) {



		var sigText = getReporter();
		sigText += "\n" + "{color:%s}".replace( "%s", signature.color );
		sigText += signature.hruler;
		sigText += "\n" + signature.name;
		sigText += "\n" + signature.position;
		sigText += "\n\n" + signature.headline;
		sigText += "\n" + signature.url;
		sigText += "{color}";
		input.html( sigText );
		input.setCursorPosition( signature.reporter.length() );
	}
}
;

// format date to relative "nn minutes/hours/days ago"
function relativeDateFormat( datetime, fallback ) {
	var msPerMinute = 60 * 1000;
	var msPerHour = msPerMinute * 60;
	var msPerDay = msPerHour * 24;
	var msPerWeek = msPerDay * 7;
	var msPerMonth = msPerDay * 30;
	var msPerYear = msPerDay * 365;

	var current = new Date();
	var elapsed = current - datetime;

	if ( elapsed < msPerMinute ) {
		return Math.round( elapsed / 1000 ) + ' seconds ago';
	} else if ( elapsed < msPerHour ) {
		return Math.round( elapsed / msPerMinute ) + ' minutes ago';
	} else if ( elapsed < msPerDay ) {
		return Math.round( elapsed / msPerHour ) + ' hours ago';
	} else if ( elapsed < msPerMonth ) {
		return Math.round( elapsed / msPerDay ) + ' days ago';
	} else {
		return fallback;
	}
}

var ticketID = window.location.href.match(/([0-9]+){1}/)[0];
$( '#installation-details ul:first li:first' ).before('<li><a href="https://support.ez.no/ticket/view/' + ticketID + '" target="_BLANK">support.ez.no/ticket/view/' + ticketID + '</a></li>');

$( '#sd-comment-collapsed-textarea' ).focus( prefillSignature );
waitForKeyElements(
		'.sd-comment-textarea',
		prefillSignature
		);

waitForKeyElements(
		'#issuetable',
		function () {
			$( '#issuetable .issuerow .updated' ).each( function () {
				var label = $( 'span', this );
				var time = $( 'time', this );

				// get readable datetime from tooltip
				var readable = label.attr( 'title' );
				// get date from time attribute
				var dtime = new Date( time.attr( 'datetime' ) );

				time.html( relativeDateFormat( dtime, time.html() ) );
			} );
		}
);
