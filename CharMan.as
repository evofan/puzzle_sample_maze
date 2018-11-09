package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * キャラクター（人）関連
	 * @author 
	 */
	public class CharMan extends MovieClip {
		
		public var cells;
		public var cx:int;// 初期位置
		public var cy:int;// 初期位置
		public var vx:int = 0;
		public var vy:int = 0;
		public var timer:int;
		public var manState:int = 0;// 0:stop, 1:move
		
		private var _root:Object;
		
		public var mc_wall:MovieClip;
		public var mc_man:MovieClip;
	
		public function CharMan(e:Object):void {
			
			_root = e;
			
			// 人を初期位置に設置
			cx = CharCell.num1stY;
			cy = CharCell.num1stX;
			
			_root.mc_man.y = cy * 100;
			_root.mc_man.x = cx * 100;
			
			this.addEventListener(Event.ENTER_FRAME, thisOnEnterFrame);	
			_root.stage.addEventListener(KeyboardEvent.KEY_DOWN, thisOnKeyDown);
			
		}
			
		public function thisOnEnterFrame(e:Event):void{

			if (manState === 0){
				// trace("人停止中");
			} else {
				// trace("人移動中");
			}
			
		}
		
		public function thisOnKeyDown(e:KeyboardEvent){

			_root.tf_status.text = "キー押した";
			
			if(manState === 0){

				manState = 1;
				vx = vy = 0;
				
				switch(e.keyCode){
					case (Keyboard.LEFT) :
						_root.tf_status.text = "左キー";
						vx = -1;
						MovieClip(root).mc_man.gotoAndPlay("left");
						break;
					case (Keyboard.RIGHT) :
						_root.tf_status.text = "右キー";
						vx = 1;
						MovieClip(root).mc_man.gotoAndPlay("right");
						break;
					case (Keyboard.UP) :
						_root.tf_status.text = "上キー";
						vy = -1;
						MovieClip(root).mc_man.gotoAndPlay("up");
						break;
					case (Keyboard.DOWN) :
						_root.tf_status.text = "下キー";
						vy = 1;
						MovieClip(root).mc_man.gotoAndPlay("down");
						break;
					default :
						//
				}
				
				if (vx !== 0 || vy !== 0){
					trace("キー入力されたので移動する");
					
					trace("cx: " + cx);
					trace("cy: " + cy);
					trace("vx: " + vx);
					trace("vy: " + vy);
					trace("CharCell.getCell(cy + vy, cx + vx): " + CharCell.getCell(cy + vy, cx + vx));
					
					if (CharCell.getCell(cy + vy, cx + vx) === 0){
						trace("移動先は空なので移動可");
						// 配列上のデータ操作
						CharCell.setCell(cy, cx, 0);// 自分の居た位置に0
						CharCell.setCell(cy + vy,cx + vx, 5);// 移動先に5
						cx += vx;
						cy += vy;
						manState = 1;
						timer = 1000;
					} else {
						trace("移動不可");
						trace("cx: " + cx);
						trace("cy: " + cy);
						trace("vx: " + vx);
						trace("vy: " + vy);
						trace("");
					}
					
				}
			
			}
			
			if (manState === 1){
				
				MovieClip(root).mc_man.x = (cx ) * 100;
				MovieClip(root).mc_man.y = (cy ) * 100;
				trace("現在Xは、" + cx);
				trace("現在Yは、" + cy);
				vx = vy = 0;
				manState = 0;
			
			}
			
		}
			
	}
	
}