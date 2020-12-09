import js.Browser.document as doc;

import locomotive.LocomotiveScroll;
using locomotive.LocoTools;
import js.html.Element;

class Main {
	static function main() {
		trace("Hello, world!");
		doc.getElementById("two").assignScroll();
		doc.getElementById("two").assignScrollCall("twop");
		doc.getElementById("two").assignScrollRepeat();
		
		
		
		var loco = new LocomotiveScroll({
			el: doc.querySelector('[data-scroll-container]'),
			smooth: true,
			//repeat: true
		});
		//loco.on(scroll,(n)->{trace(n.currentElements);});
		loco.on(call,(func,status)->{
			trace(func);
			trace(status);
		});
		//loco.scrollTo("#five");
	}

	

}
