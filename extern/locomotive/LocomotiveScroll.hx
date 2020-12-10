package locomotive;

import js.html.Element;

typedef Point = {
	x:Int,
	y:Int
}

typedef ScrollData = {
	scroll:Point,
	limit:Point,
	currentElements:Dynamic
}

typedef ScrollToOptions = {
	?offset:Int,
	?callback:Void->Void,
	?duration:Int,
	?easing:Array<Float>,
	?disableLerp:Bool,
}

typedef Scroll = ScrollOptions & {
	isMobile:Bool,
	isTablet:Bool,
	namespace:String,
	html:Element,
	windowHeight:Int,
	windowWidth:Int,
	windowMiddle:Point,

	// //todo ...
	els:Array<Dynamic>, //object array access but begin by 1 ???
	currentElements:Map<Int,Dynamic>,//object array access but begin by 1 ???
	listeners:Dynamic,
	intance:Dynamic,
}

typedef TabletOptions = {
	?smooth:Bool,
	?direction:String,
	?gestureDirection:String,
	?breakpoint:Int
}

typedef ScrollOptions = {
	//	document	Scroll container element.
	?el:Element,
	//	'scroll'	Data attribute prefix (data-scroll-xxxx).
	?name:String,
	// (2)	[0,0]	Global in-view trigger offset : [bottom,top]
	// String with % to use a percentage of the viewport height.
	// numeric value for absolute pixels unit.
	// g. ["30%",0], [100,0], ["30%", 100]
	?offset:Array<Dynamic>,
	//	false	Repeat in-view detection.
	?repeat:Bool,
	//	false	Smooth scrolling.
	?smooth:Bool,
	//	vertical	Smooth only
	// : vertical or horizontal
	?direction:String,
	//	0.1	Smooth only
	// (lerp) intensity. Float between 0 and 1.
	// Linear: interpolation,
	// the "smoothness" intensity. The closer to 0, the smoother.
	?lerp:Float,

	//	false	Add direction to scroll event.
	?getDirection:Bool,
	//	false	Add speed to scroll event.
	?getSpeed:Bool,
	//	is-inview	Element in-view class.
	?classe:String,
	//	has-scroll-init	Initialize class.
	?initClass:String,
	//	has-scroll-scrolling	Is scrolling class.
	?scrollingClass:String,
	//	has-scroll-dragging	Is dragging class.
	?draggingClass:String,
	//	has-scroll-smooth	Has smooth scrolling class.
	//	false	Smooth only
	?smoothClass:String,
	// container element for the scrollbar to be appended in. If false, scrollbar will be appended to the body.
	// Specifies: the,
	?scrollbarContainer:Element,
	//	c-scrollbar	Smooth only
	?scrollbarClass:String,
	//	1	Smooth only
	// Factor applied to the scroll delta, allowing to boost/reduce scrolling speed (regardless of the platform).
	?multiplier:Float,
	//	50	Smooth only
	// Boost scrollingspeed of Firefox on Windows.
	?firefoxMultiplier:Int,
	//	2	Smooth only
	// Mutiply touch action to scroll faster than finger movement.
	?touchMultiplier:Int,
	//	false	Smooth only
	//  By: default,locomotive-scroll listens for scroll events only on the scroll container (el option). With this option set to true, it listens on the whole document instead.
	?scrollFromAnywhere:Bool,
	//	vertical	Smooth only
	// Defines which gesture direction(s) scrolls in your instance. You can use :
	// vertical
	// horizontal
	// both
	// gesture direction(s) scrolls in your instance. You can use :
	?gestureDirection:String,
	/*
		Object allowing to override some options for a particular context. You can specify:
		-smooth
		-direction
		-horizontalGesture
		For tablet context you can also define breakpoint (integer, defaults to 1024) to set the max-width breakpoint for tablets.
	 */
	?tablet:TabletOptions,
	?smartphone:TabletOptions,
	// context you can also define breakpoint (integer, defaults to 1024) to set the max-width breakpoint for tablets.
	//	false	Allows to reload the page when switching between desktop, tablet and smartphone contexts. It can be useful if your page changes a lot between contexts and you want to reset everything.
	?reloadOnContextChange:Bool,
	//	true	Sets history.scrollRestoration = 'manual' and calls window.scrollTo(0, 0) on locomotive-scroll init in Native Class. Useful if you use transitions with native scrolling, otherwise we advise to set it to false if you don't want to break History API's scroll restoration feature.
	?resetNativeScroll:Bool,
}

enum abstract ScrollEvent(String) {
	var scroll;
	var call;
}

@:native('LocomotiveScroll')
extern class LocomotiveScroll {
	public var options:ScrollOptions;

	public var el:Element;
	public var name:String;
	public var offset:Array<Dynamic>;
	public var repeat:Bool;
	public var smooth:Bool;
	public var direction:String;
	public var gestureDirection:String;
	public var reloadOnContextChange:Bool;
	public var lerp:Float;
	// public var class :String;
	public var scrollbarContainer:Element;
	public var scrollbarClass:String;
	public var scrollingClass:String;
	public var draggingClass:String;
	public var smoothClass:String;
	public var initClass:String;
	public var getSpeed:Bool;
	public var getDirection:Bool;
	public var scrollFromAnywhere:Bool;
	public var multiplier:Int;
	public var firefoxMultiplier:Int;
	public var touchMultiplier:Int;
	public var resetNativeScroll:Bool;
	public var tablet:TabletOptions;
	public var smartphone:TabletOptions;

	public var scroll:Scroll;

	public function new(?options:ScrollOptions):Void;

	public function init():Void; //	Reinitializes the scroll.

	@:overload(function(eventName:ScrollEvent, cb:String->String->Void):Void {})
	public function on(eventName:ScrollEvent, cb:ScrollData->Void):Void; // , function)	Listen instance events ⬇.
	public function update():Void; //	Updates all element positions.
	public function destroy():Void; //	Destroys the scroll events.
	public function start():Void; //	Restarts the scroll events.
	public function stop():Void; //	Stops the scroll events.

	/*Scroll to a target.	
		target: Defines where you want to scroll. Available values types are :
		node : a dom element
		string : you can type your own selector, or use values "top" and "bottom" to reach scroll boundaries
		int : An absolute scroll coordinate in pixels
		options (optional, object) : Settings object. Available values are:
		offset (integer) : Defines an offset from your target. E.g. -100 if you want to scroll 100 pixels above your target
		callback (function) : Called when scrollTo completes (note that it won't wait for lerp to stabilize)
		duration (integer) : Defines the duration of the scroll animation in milliseconds. Defaults to 1000
		Smooth only
		easing (array) : An array of 4 floats between 0 and 1 defining the bezier curve for the animation's easing.
		Defaults to [0.25, 0.00, 0.35, 1.00]
		See http://greweb.me/bezier-easing-editor/example/
		Keep in mind this will also be affected by the lerp unless you set disableLerp to true.
		Smooth only
		disableLerp (boolean) : Lerp effect won't be applied if set to true
		Smooth only
	 */
	public function scrollTo(target:Dynamic, ?options:ScrollToOptions):Void;
}
