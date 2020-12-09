package locomotive;
import js.html.Element;

using Std;

class LocoTools {
	public static function assignScroll(el:Element):Element {
		el.dataset.scroll = "";
		return el;
	}

	public static function assignScrollContainer(el:Element):Element {
		el.dataset.scrollContainer = "";
		return el;
	}

	public static function assignScrollSection(el:Element):Element {
		el.dataset.scrollSection = "";
		return el;
	}

	public static function assignScrollClass(el:Element, classe:String):Element {
		el.dataset.scrollClass = classe;
		return el;
	}

	/*
		Element in-view trigger offset : bottom,top
		First value is bottom offset, second (optional) is top offset.
		Percent is relative to viewport height, otherwise it's absolute pixels.
		E.g. "10", "100,50%", "25%, 15%" */
	public static function assignScrollOffset(el:Element, offset:haxe.extern.EitherType<Int, String>):Element {
		el.dataset.scrollOffset = offset.string();
		return el;
	}

	public static function assignScrollRepeat(el:Element,?repeat:Bool=true):Element {
		el.dataset.scrollRepeat = repeat.string();
		return el;
	}

	/*
		top, bottom, left or right
		Window position of in-view trigger. */
	public static function assignScrollPosition(el:Element, pos:String):Element {
		el.dataset.scrollPosition = pos;
		return el;
	}

	public static function assignScrollSpeed(el:Element, speed:Float):Element {
		el.dataset.scrollSpeed = speed.string();
		return el;
	}

	public static function assignScrollDelay(el:Element, delay:Float):Element {
		el.dataset.scrollDelay = delay.string();
		return el;
	}

	public static function assignScrollDirection(el:Element, dir:String):Element {
		el.dataset.scrollDirection = dir;
		return el;
	}

	public static function assignScrollSticky(el:Element, sticky:Bool):Element {
		el.dataset.scrollSticky = sticky.string();
		return el;
	}

	public static function assignScrollTarget(el:Element, target:Bool):Element {
		el.dataset.scrollTarget = target.string();
		return el;
	}

	public static function assignScrollCall(el:Element, ?data:Dynamic = true):Element {
		el.dataset.scrollCall = data.toString();
		return el;
	}

	public static function assignScrollId(el:Element, data:String):Element {
		el.dataset.scrollId = data.toString();
		return el;
	}
}
