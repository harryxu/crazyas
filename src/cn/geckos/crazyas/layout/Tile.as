package cn.geckos.crazyas.layout
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Graphics;

	/**
	 * 
	 *  @author jeff.xu (http://blog.jeffxu.cn)
	 *  @since 2008/7/31
	 * 
	 */
	
	public class Tile extends Layout
	{
		public static const VERTICAL:String = "vertical";
		public static const HORIZONTAL :String = "horizontal";

		private var _preferredWidth:Number = -1;
		private var _preferredHeight:Number = -1;
		private var _minWidth:Number = -1;
		private var _minHeight:Number = -1;
		
		private var _hGap:Number = 5;
		private var _vGap:Number = 5;
		private var _direction:String = Tile.HORIZONTAL;

		public function Tile()
		{
			super();
		}

		override public function doLayout():void
		{
			if (this._direction == Tile.HORIZONTAL)
			{
				this.doHLayout();
			}else
			{
				this.doVLayout();
			}
			
			this.drawMask();
		}
		
		protected function doHLayout():void
		{
			var size:Number = super.contentLayer.numChildren;
			var o:DisplayObject = null;
			var xPosition:Number = 0;
			var yPosition:Number = 0;
			var highest:Number = 0;
			var widthest:Number = 0;
			
			for(var i:int = 0; i < size; i++)
			{
				o = super.contentLayer.getChildAt(i);
				//trace("content "+o.height+" ", o.width);
				//trace(this._hGap);
				//trace(o.name);
				
				if (i == 0)
				{
					o.x = xPosition;
					o.y = yPosition;
					xPosition = o.width + this._hGap;
					highest = o.height;
				}else
				{
					if (this._preferredWidth == -1 || o.width + xPosition <= this._preferredWidth)
					{
						o.x = xPosition;
						o.y = yPosition;
					}else
					{
						xPosition = 0;
						yPosition = yPosition + highest + this._vGap;
						o.y = yPosition;
						o.x = xPosition;
						//trace(yPosition, highest);
						highest = o.height;
					}
					xPosition = xPosition + o.width + this._hGap;
					highest = o.height > highest?o.height:highest;
					//trace("highest: "+highest);
				}
			}
		}
		
		protected function doVLayout():void
		{
			var size:Number = super.contentLayer.numChildren;
			var o:DisplayObject = null;
			var xPosition:Number = 0;
			var yPosition:Number = 0;
			var highest:Number = 0;
			var widthest:Number = 0;
			
			for(var i:int = 0; i < size; i++)
			{
				o = super.contentLayer.getChildAt(i);
				//trace("content "+o.height+" ", o.width);
				//trace(this._vGap);
				
				if (i == 0)
				{
					o.x = xPosition;
					o.y = yPosition;
					yPosition = o.height + this._vGap;
					widthest = o.width;
				}else
				{
					if (this._preferredHeight == -1 || o.height + yPosition <= this._preferredHeight)
					{
						o.x = xPosition;
						o.y = yPosition;
					}else
					{
						yPosition = 0;
						xPosition = xPosition + widthest + this._hGap;
						o.x = xPosition;
						o.y = yPosition;
						widthest = o.width;
						//trace(this._hGap, widthest);
					}
					yPosition = yPosition + o.height + this._vGap;
					widthest = o.width > widthest?o.width:widthest;
				}
			}
		}
		
		private function drawMask():void
		{
			var dw:Number = this._preferredWidth == -1?super.contentLayer.width+2:this._preferredWidth;
			var dh:Number = this._preferredHeight == -1?super.contentLayer.height+2:this._preferredHeight;
			var g:Graphics = super.maskLayer.graphics;
			//trace(dw, dh);
			g.clear();
			g.beginFill(0xffffff);
			g.drawRect(0, 0, dw, dh);
			g.endFill();
		}
		
		override public function set width(w:Number):void
		{
			if (this._minWidth == -1 || w >= this._minWidth)
			{
				this.preferredWidth = w;
				//trace("w: "+preferredWidth);
			}
		}
		override public function get width():Number
		{
			return super.width;
		}
		
		override public function set height(h:Number):void
		{
			if (this._minHeight == -1 || h >= this._minHeight)
			{
				this.preferredHeight = h;
				//trace("h: "+preferredHeight);
			}
		}
		override public function get height():Number
		{
			return super.width;
		}

		public function set preferredWidth(mxW:Number):void
		{
			if (mxW > 0 && mxW >= this._minWidth)
			{
				this._preferredWidth = mxW;
				super.requireLayout();
			}
		}
		public function get preferredWidth():Number
		{
			return this._preferredWidth;
		}
		
		public function set preferredHeight(mxH:Number):void
		{
			if (mxH > 0 && mxH >= this._minHeight)
			{
				this._preferredHeight = mxH;
				super.requireLayout();
			}
		}
		public function get preferredHeight():Number
		{
			return this._preferredHeight;
		}

		public function set minWidth(miW:Number):void
		{
			if (miW >= 0)
			{
				this._minWidth = miW;
				super.requireLayout();
			}
		}
		public function get minWidth():Number
		{
			return this._minWidth;
		}

		public function set minHeight(miH:Number):void
		{
			if (miH >= 0)
			{
				this._minHeight = miH;
				super.requireLayout();
			}
		}
		public function get minHeight():Number
		{
			return this._minHeight;
		}
		
		public function set vGap(v:Number):void
		{
			if (this._preferredHeight == -1 || (v < this._preferredHeight && v >= 0))
			{
				this._vGap = v;
				super.requireLayout();
			}
		}
		public function get vGap():Number
		{
			return this._vGap;
		}
		
		public function set hGap(h:Number):void
		{
			if (this._preferredWidth == -1 || (h < this._preferredWidth && h >= 0))
			{
				this._hGap = h;
				super.requireLayout();
			}
		}
		public function get hGap():Number
		{
			return this._hGap;
		}
		
		public function set direction(d:String):void
		{
			if (d == Tile.HORIZONTAL || d == Tile.VERTICAL)
			{
				this._direction = d;
				super.requireLayout();
			}
		}
		public function get direction():String
		{
			return this._direction;
		}
	}
}
