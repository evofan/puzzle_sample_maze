package {
	
	/**
	 * キャラクター迷路セル関連
	 * @author 
	 */
	import flash.display.MovieClip;
	import MazeData;
	 
	public class CharCell extends MovieClip {
		
		// 迷路セル関連
		public static var cells:Array = new Array();// セル全体
		public static var cellHeight:int = 10;// セル横数
		public static var cellWidth:int = 10;// セル縦数
		
		public static var num1stX:int;
		public static var num1stY:int;
		
		public var mc_man:MovieClip;
		public var main:Main;
	
		// コンストラクタ、引数で受け取った数に応じて（X x Yの）迷路を作成
		public function CharCell(e:Object, width:int=10, height:int=10):void{
			
			cellWidth = width;
			cellHeight = height;

			// 初期化null（0）埋め
			for (var i = 0; i < cellHeight; i++ ){
				cells[i] = [];// 行クリア
				for (var j = 0; j < cellWidth; j++ ){
					cells[i].push(0);// 列0埋め
				}
			}
			
			MazeData.setData();
			
			// 初期位置を探す
			for (var k = 0; k < height; k++){
				for (var l = 0; l < width; l++ ){
					if (cells[k][l] === 5){
						// プレイヤー初期位置設定
						num1stX = k;
						num1stY = l;
					}
					if (cells[k][l] === 1){
						// 壁描画
						var mcWall:MovieClip = new mc_wall();// アタッチ
						addChild(mcWall);
						mcWall.x = l * 100;
						mcWall.y = k * 100;
					}
				}
			}
			
		}
		
		// セルのデータ取得
		public static function getCell(yPos:int, xPos:int) {
			if (xPos >= 0 && xPos < cellWidth && yPos >= 0 && yPos < cellHeight) {
				var data = cells[yPos][xPos];
				trace("data : " + data);
				return data;
			} else {
				trace("迷路外");
			}
		}
		
		// セルのデータ設定
		public static function setCell(yPos:int, xPos:int, val:int) {
			if (xPos >= 0 && xPos < cellWidth && yPos >= 0 && yPos < cellHeight) {
				cells[yPos][xPos] = val;
				trace("セルデータセット");
			} else {
				trace("迷路外");
			}	
		}
		
		// セルのデータ入れ替え
		public static function swapCell(yPos1:int, xPos1:int, yPos2:int, xPos2:int) {
			var val1 = getCell(yPos1, xPos1);
			var val2 = getCell(yPos2, xPos2);
			setCell(yPos1, xPos1, val2);
			setCell(yPos2, xPos2, val1);
			trace("入れ替え完了");
		}
	
	}

		
}