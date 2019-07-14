package {
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Main extends MovieClip {
		
		public var aaa:Number = 10;
		public var bbb:int = 100;
		
		private var ddd:String = "これはMainのprivate";
		public var eee:String = "これはMainのpublic";
		public static var fff:String = "これはMainのStatic";
		
		private var _root:Object;
		
		//public var mc_circle:MovieClip;
		
		public function Main(e:Object):void{
			
			trace("Main !");
			trace("aaa: " + aaa);
			
			_root = e;
			_root.mc_circle.alpha = 0.5;//ok
			
			//MovieClip(root).mc_circle.alpha = 0.2;//err ?
			
			trace( "_root.ccc : " + _root.ccc );//_root.ccc : タイムラインのccc
			
			trace("ddd: " + ddd);//ok
			
		}
		
	}


}