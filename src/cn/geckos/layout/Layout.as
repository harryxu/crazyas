package cn.geckos.layout
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.events.Event;

	/**
	 *  
	 *  @author jeff.xu  (http://blog.jeffxu.cn)
	 *  @author harry.xu (http://harryxu.cn/blog)
	 *  @since 2007/12/1
	 * 
	 */
	
	public class Layout extends Sprite
	{
		private var changed:Boolean = false;
		protected var contentLayer:Sprite;
		protected var maskLayer:Shape;

		public function Layout()
		{
			super();
			this.contentLayer = new Sprite();
			this.contentLayer.x = 0;
			this.contentLayer.y = 0;
			this.initMaskLayer();
			super.addChild(this.contentLayer);
			super.addChild(this.maskLayer);
			this.addEventListener(Event.ADDED_TO_STAGE, __addToStage);
		}
		
		private function initMaskLayer():void
		{
			this.maskLayer = new Shape();
			
			var g:Graphics = this.maskLayer.graphics;
			g.beginFill(0xffffff);
			g.drawRect(0, 0, 2, 2);
			g.endFill();
			
			this.maskLayer.x = 0;
			this.maskLayer.y = 0;
			this.maskLayer.x = 0;
			this.maskLayer.y = 0;
			this.maskLayer.width = 2;
			this.maskLayer.height = 2;
			this.mask = maskLayer;
		}

		override public function addChild(child:DisplayObject):DisplayObject
		{
			var o:DisplayObject = contentLayer.addChild(child);
			this.requireLayout();
			return o;
		}

		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			var o:DisplayObject = contentLayer.addChildAt(child, index);
			this.requireLayout();
			return o;
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			var o:DisplayObject = contentLayer.removeChild(child);
			this.requireLayout();
			return o;
		}

		override public function removeChildAt(index:int):DisplayObject
		{
			var o:DisplayObject = contentLayer.removeChildAt(index);
			this.requireLayout();
			return o;
		}

		public function doLayout():void
		{
			// empty function, need to be overreden
		}

		protected function requireLayout():void
		{
			changed = true;
			if(stage != null) stage.invalidate();
		}

		private function __addToStage(e:Event):void
		{
			stage.addEventListener(Event.RENDER, __render);
                	if(changed) stage.invalidate();
			
		}

		private function __render(e:Event):void {
                	if(changed) {
                        	doLayout();
                        	changed = false;
                	}
       		}
	}
}
