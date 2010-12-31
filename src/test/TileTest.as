package
{
	import cn.geckos.layout.Tile;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class TileTest extends Sprite
	{
		private var t:Tile;
		private var vBt:Sprite;
		private var hBt:Sprite;
		
		public function TileTest()
		{	
			//testHLayout();
			//testVLayout();
			testHLayoutDynamicaly();
		}
		
		private function testVLayout():void
		{
			t = new Tile();
			t.direction = Tile.VERTICAL;
			t.hGap = 0;
			t.vGap = 0;
			//t.maxWidth = 2;
			t.height = 200;
			t.width = 500;
			var tex:TextField = null;
			for (var i:Number = 0; i < 10; i++)
			{
				tex = new TextField();
				tex.border = true;
				tex.text = "hello world" + i;
				//tex.width = 20;
				tex.height = 20 + i * 5;
				tex.width = 20 + i * 5;
				//trace(tex.height+" "+tex.width);
				t.addChild(tex);
			}
			this.addChild(t);
		}
		
		private function testHLayout():void
		{
			t = new Tile();
			t.hGap = 0;
			t.vGap = 0;
			t.width = 500;
			//t.maxHeight = 2
			var tex:TextField = null;
			for (var i:Number = 0; i < 10; i++)
			{
				tex = new TextField();
				tex.border = true;
				tex.text = "hello world" + i;
				//tex.width = 20;
				tex.height = 20+i*5;
				//trace(tex.height+" "+tex.width);
				t.addChild(tex);
			}
			this.addChild(t);
		}
		
		private function testHLayoutDynamicaly():void
		{
			testVLayout();
			hBt = new Sprite();
			var g:Graphics = hBt.graphics;
			g.beginFill(0x551122);
			g.drawRect(0, 0, 50, 25);
			g.endFill();
			hBt.x = 500;
			hBt.y = 200;
			hBt.buttonMode = true;
			hBt.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownEventH);
			//hBt.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveEvent);
			hBt.addEventListener(MouseEvent.MOUSE_UP, _mouseUpEvent);
			
			vBt = new Sprite();
			g = vBt.graphics;
			g.beginFill(0x551122);
			g.drawRect(0, 0, 25, 50);
			g.endFill();
			vBt.x = 200;
			vBt.y = 500;
			vBt.buttonMode = true;
			vBt.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownEventV);
			//vBt.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMoveEvent);
			vBt.addEventListener(MouseEvent.MOUSE_UP, _mouseUpEvent);
			
			this.addChild(vBt);
			this.addChild(hBt);
			this.addEventListener(Event.ENTER_FRAME, _enterframeEvent);
		}
		
		private function _enterframeEvent(e:Event):void
		{
			t.width = hBt.x;
			t.height = vBt.y;
			//trace(hBt.x, vBt.y);
		}
		
		private function _mouseMoveEvent(e:Event):void
		{
			t.width = hBt.x;
			t.height = vBt.y;
		}
		
		private function _mouseDownEventH(e:MouseEvent):void
		{
			var bt:Sprite = Sprite(e.target);
			var range:Rectangle = new Rectangle(0, bt.y, 1000, 0); 
			bt.startDrag(false, range);
		}
		
		private function _mouseDownEventV(e:MouseEvent):void
		{
			var bt:Sprite = Sprite(e.target);
			var range:Rectangle = new Rectangle(bt.x, 0, 0, 1000); 
			bt.startDrag(false, range);
		}
		
		private function _mouseUpEvent(e:MouseEvent):void
		{
			var bt:Sprite = Sprite(e.target);
			bt.stopDrag();
			t.width = hBt.x;
			t.height = vBt.y;
			//trace(hBt.x,vBt.y);
		}
	}
}
