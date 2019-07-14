package 
{
	import flash.display.MovieClip;
	//import CharCell;//static使わなくても書かないと、参照時Flash develop上でエラー出る
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import caurina.transitions.Tweener;
	
	/**
	 * ...キャラクター人関連
	 * @author 
	 */
	public class CharMan extends MovieClip {
		
		public var cells;
		public var cx:int;//初期位置
		public var cy:int;//初期位置
		public var vx:int = 0;
		public var vy:int = 0;
		public var timer:int;
		public var manState:int = 0;// 0:stop, 1:move
		
		private var _root:Object;//thisRoot : [object MainTimeline]
		
		//rootのMCを動かすにはクラス内で一度プロパティ化
		public var mc_wall:MovieClip;
		public var mc_man:MovieClip;
	
		public function CharMan(e:Object):void {
			
			_root = e;
			trace( "thisRoot : " + _root );
			

			trace("CharMan !");//CharMan !
			
			trace("CharCell: " + CharCell);//CharCell: [class CharCell]
			//trace("CharCell.cells: " + CharCell.cells);//err.未定義～
			
			//extends Movieclipでなく、extends　Ｃｈａｒｃｅｌｌなら取れる
			//trace("cells: " + cells);//cells: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			
			trace(CharCell.temp);//取れる？★staticなら取れる
			
			//MovieClip(root).mc_man.x = 300;// (CharCell.num1stX) * 100;
			//MovieClip(root).mc_man.y = 600;// (CharCell.num1stY) * 100;
			
			//人を初期位置に設置
			cx = CharCell.num1stY;
			cy = CharCell.num1stX;
			
			
			_root.mc_man.y = cy * 100;
			_root.mc_man.x = cx * 100;
			
			//壁を初期位置に設置
			
			this.addEventListener(Event.ENTER_FRAME, thisOnEnterFrame);
			
			_root.stage.addEventListener(KeyboardEvent.KEY_DOWN, thisOnKeyDown);
			
		}
	
			
		public function thisOnEnterFrame(e:Event):void{
			//trace("エンターフレーム");// ok
			if (manState === 0){
				//trace("人停止中");
			} else {
				//trace("人移動中");
				//TODO: Tweenerで移動、移動完了でフラグ0に
				//★キーダウン側では目的座標設定+フラグ1に
			}
			
		}
		
		public function thisOnKeyDown(e:KeyboardEvent){
			trace("キー押した");
			
			//thisRoot(MovieClip).mc_wall.alpha = 0.25;
			
			_root.tf_status.text = "キー押した！";
			
			//trace(MovieClip(root));//[object MainTimeline]
			
			//MovieClip(root).gotoAndPlay(2);
			
			//MovieClip(root).mc_wall.alpha = 0.1;
			
			
			//MovieClip(root).tf_status.text = "キー押した！";
			
			if(manState === 0){

				manState = 1;
				vx = vy = 0;//フラグリセット
				
				switch(e.keyCode){
					case (Keyboard.LEFT) :
						trace("左キー");
						_root.tf_status.text = "左キー！";
						vx = -1;
						MovieClip(root).mc_man.gotoAndPlay("left");
						break;
					case (Keyboard.RIGHT) :
						trace("右キー");
						_root.tf_status.text = "右キー！";
						vx = 1;
						MovieClip(root).mc_man.gotoAndPlay("right");
						break;
					case (Keyboard.UP) :
						trace("上キー");
						_root.tf_status.text = "上キー！";
						vy = -1;
						MovieClip(root).mc_man.gotoAndPlay("up");
						break;
					case (Keyboard.DOWN) :
						trace("下キー");
						_root.tf_status.text = "下キー！";
						vy = 1;
						MovieClip(root).mc_man.gotoAndPlay("down");
						break;
					default :
						trace("default");
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
						//配列上のデータ操作
						//CharCell.swapCell(cx, cy, cx + vx, cy + vy);
						CharCell.setCell(cy, cx, 0);//自分の居た位置に0
						CharCell.setCell(cy + vy,cx + vx, 5);//移動先に5
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
				trace("移動なので人をを動かす");
				//timer-=10;
				
				//MovieClip(root).mc_man.x = (cx ) * 100;
				//MovieClip(root).mc_man.y = (cy ) * 100;
				
				Tweener.addTween(MovieClip(root).mc_man, {
					x: cx * 100,
					y: cy * 100,
					time: 0.25,
					onComplete:onMoveEnd
					
				});
				
				trace("現在Xは、" + cx);
				trace("現在Yは、" + cy);
				
				/*
				if (timer < 0 ){
					vx = vy = 0;
					manState = 0;
				}
				*/
				function onMoveEnd(){
					trace("キャラ移動終了");
					vx = vy = 0;
					//manState = 0;
				}
				
				manState = 0;//移動完了前にクリア＝先行入力可能
								
				//thisRoot.mc_man.gotoAndPlay("normal");
				
				//return false;
				
			}
			
		}

	
			
	}
	
}