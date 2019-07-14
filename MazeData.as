package 
{
	import flash.display.MovieClip;
	import CharCell;
	
	/**
	 * ...
	 * @author 
	 */
	public class MazeData extends MovieClip	{
		
		public var temp:Number;

		public static var mazeRaw:Array = [
			[1, 1, 1, 1, 1, 1, 1, 1,1],
			[1, 0, 0, 0, 0, 0, 1, 1,1],
			[1, 0, 1, 1, 1, 1, 0, 1,1],
			[1, 0, 1, 0, 0, 0, 0, 0,1],
			[1, 5, 0, 0, 1, 1, 1, 1,1],
			[1, 1, 1, 1, 1, 1, 1, 1,1]
		];
		
		public function MazeData(e:Object):void{
			
			trace("MazeData !");
			
		}
		
		public static function setData(){
			
			trace("MazeRaw: " + mazeRaw);
			trace("MazeRaw.length: " + mazeRaw.length);//6
			trace("MazeRaw[0]: " + mazeRaw[0]);//6
			trace("CharCell.cellY: " + CharCell.cellWidth);
			//迷路データを配列から代入
		
			for (var i:int = 0; i < CharCell.cellWidth; i++){
				//CharCell.cells[i].push(mazeRaw[i]);
				CharCell.cells[i] = mazeRaw[i];
				//for (var j:int = 0; j < CharCell.cellX; j++ ) {
				//	CharCell.cells[i][j].push()
				//}
			}
			trace(CharCell.cells[i]);
			
		}
		
	}
	
}