package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class vBits extends Bitmap
	{
		public function vBits()
		{
			super(new BitmapData(16, 2, false, 0x000000));
			
			bitmapData.fillRect(new Rectangle(0, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(2, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(4, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(6, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(8, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(10, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(12, 0, 2, 2), 0xFFFFFF);
			bitmapData.fillRect(new Rectangle(14, 0, 2, 2), 0xFFFFFF);
		}
	}
}