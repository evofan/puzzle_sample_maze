package {
	
	import flash.display.MovieClip;
	import CharCell;
	
	/**
	 * ...
	 * @author 
	 */
	public class MazeData extends MovieClip	{

		// 迷路データ
		public static var mazeRaw:Array = [
			[1, 1, 1, 1, 1, 1, 1, 1, 1],
			[1, 0, 0, 0, 0, 0, 1, 1, 1],
			[1, 0, 1, 1, 1, 1, 0, 1, 1],
			[1, 0, 1, 0, 0, 0, 0, 0, 1],
			[1, 5, 0, 0, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1, 1]
		];
		
		public function MazeData(e:Object):void{
			//
		}
		
		public static function setData(){
				
			// 迷路データを配列から代入		
			for (var i:int = 0; i < CharCell.cellWidth; i++){
				CharCell.cells[i] = mazeRaw[i];
			}
			trace(CharCell.cells[i]);
			
		}
		
	}
	
}