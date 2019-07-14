package {
	
	/**
	 * ...キャラクター迷路セル関連
	 * @author 
	 */
	import flash.display.MovieClip;
	import MazeData;
	//import Main;
	
	 
	public class CharCell extends MovieClip {
		
		//迷路セル関連
		public static var cells:Array = new Array();//セル全体
		public static var cellHeight:int = 10;//セル横数
		public static var cellWidth:int = 10;//セル縦数
		
		public static var num1stX:int;
		public static var num1stY:int;
		
		public var mc_man:MovieClip;
		
		public var main:Main;
		
		//テスト
		public static var temp = "取れる？";
	
		//コンストラクタ、引数で受け取った数に応じて（X x Yの）迷路を作成
		public function CharCell(e:Object, width:int=10, height:int=10):void{
			
			//var ccc:String = "ｾﾙｶﾝﾘ";
			trace("CharCell !");
			//trace("ccc: " + ccc);
			cellWidth = width;
			trace( "cellWidth : " + cellWidth );
			cellHeight = height;
			trace( "cellHeight : " + cellHeight );
			
			trace("Main static: " + Main.fff);//これはMainのStatic、★import不要
			//trace("main public: " + main);//main public: null
			e.mc_circle.alpha = 0.1;

			trace( "e.ddd : " + e.ddd );//undefined
			trace( "e.eee : " + e.eee );//undefined
			trace( "e.fff : " + e.fff );//undefined
			trace( "e.main : " + e.main );// [object Main]
			//trace( "e.main.ddd : " + e.main.ddd );//err（★privateなので参照不可）
			trace( "e.main.eee : " + e.main.eee );//e.main.eee : これはMainのpublic★publicはクラス名変数+変数指定
			trace( "e.fff : " + e.fff );//err
			trace( "Main.fff : " + Main.fff );//これはMainのStatic
			
			//cells = new Array();
			//cells[0] = [500,1000]
			//trace( "cells[0][1] : " + cells[0][1] );
			//cells[0][2] = 300;
			//trace( "cells[0][2] : " + cells[0][2] );
			//strace( "cells[0][0] : " + cells[0][0] );
			
			//初期化null（0）埋め
			for (var i = 0; i < cellHeight; i++ ){
				cells[i] = [];//行クリア
				for (var j = 0; j < cellWidth; j++ ){
					cells[i].push(0);//列0埋め
				}
			}
			trace("い");
			trace(cells[0]);
			trace(cells[1]);
			trace(cells[9]);//0,0,0,0,0,0,0,0,0,0
			trace(cells[10]);//undefined			
			trace("う");
			//cells[5][6] = 10000;
			
			//初期設定（壁あり場所）
			/*
			cells[0][0] = 1;//0:通路、1:壁
			cells[0][1] = 1;
			cells[1][0] = 1;
			*/
			
			/*
			cells[0] = [1, 1, 1, 1, 1, 1, 1, 1];
			cells[1] = [1, 0, 0, 0, 0, 0, 1, 1];
			cells[2] = [1, 0, 1, 1, 1, 1, 0, 1];
			cells[3] = [1, 0, 1, 0, 0, 0, 0, 1];
			cells[4] = [1, 0, 0, 0, 1, 1, 1, 1];
			cells[5] = [1, 1, 1, 1, 1, 1, 1, 1];
			*/

			
			// ★外部読み込みにして、データからアタッチして画面生成、
			// 生成後にキャラの座標を探索して配置に
			
			MazeData.setData();
			
			//cells[1][1] = 5;//人
			//初期位置を探す
			for (var k = 0; k < height; k++){
				for (var l = 0; l < width; l++ ){
					if (cells[k][l] === 5){
						//プレイヤー初期位置設定
						num1stX = k;
						num1stY = l;
						//break;
					}
					if (cells[k][l] === 1){
						//壁描画
						//MovieClip(root).mc_wall.
						var mcWall:MovieClip = new mc_wall();//アタッチ
						addChild(mcWall);
						mcWall.x = l * 100;
						mcWall.y = k * 100;
					}
				}
			}
			
			trace("cells[0]: " + cells[0]);
			trace("cells[1]: " + cells[1]);
			trace("cells[2]: " + cells[2]);
			trace("cells[3]: " + cells[3]);
			trace("cells[4]: " + cells[4]);
			trace("cells[5]: " + cells[5]);
			trace("cells[6]: " + cells[6]);
			trace("cells[7]: " + cells[7]);
			trace("cells[8]: " + cells[8]);
			
			trace( "num1stX : " + num1stX );
			trace( "num1stY : " + num1stY );			
		}
		
		//セルのデータ取得
		public static function getCell(yPos:int, xPos:int) {
			if (xPos >= 0 && xPos < cellWidth && yPos >= 0 && yPos < cellHeight) {
				var data = cells[yPos][xPos];
				trace( "data : " + data );
				return data;
			} else {
				trace("迷路外");
			}
		}
		
		//セルのデータ設定
		public static function setCell(yPos:int, xPos:int, val:int) {
			if (xPos >= 0 && xPos < cellWidth && yPos >= 0 && yPos < cellHeight) {
				cells[yPos][xPos] = val;
				trace("セルデータセット");
			} else {
				trace("迷路外");
			}	
		}
		
		//セルのデータ入れ替え
		public static function swapCell(yPos1:int, xPos1:int, yPos2:int, xPos2:int) {
			var val1 = getCell(yPos1, xPos1);
			var val2 = getCell(yPos2, xPos2);
			setCell(yPos1, xPos1, val2);
			setCell(yPos2, xPos2, val1);
			trace("入れ替え完了");
		}
	
	}

		
}