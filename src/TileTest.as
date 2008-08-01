package
{
	import cn.geckos.layout.Tile;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Graphics;

	public class TileTest extends Sprite
	{
		public function TileTest()
		{	
			testHLayout();
			//testVLayout();
		}
		
		private function testVLayout():void
		{
			var t:Tile = new Tile();
			t.direction = Tile.VERTICAL;
			t.hGap = 1;
			t.vGap = 1;
			//t.maxWidth = 2;
			t.maxHeight = 200;
			t.maxWidth = 500;
			var tex:TextField = null;
			for (var i:Number = 0; i < 10; i++)
			{
				tex = new TextField();
				tex.border = true;
				tex.text = "hello world" + i;
				tex.height = 20;
				trace(tex.height+" "+tex.width);
				t.addChild(tex);
			}
			this.addChild(t);
		}
		
		private function testHLayout():void
		{
			var t:Tile = new Tile();
			t.hGap = 1;
			t.vGap = 1;
			t.maxWidth = 500;
			//t.maxHeight = 2
			var tex:TextField = null;
			for (var i:Number = 0; i < 10; i++)
			{
				tex = new TextField();
				tex.border = true;
				tex.text = "hello world" + i;
				tex.height = 20;
				trace(tex.height+" "+tex.width);
				t.addChild(tex);
			}
			this.addChild(t);
		}
	}
}
