package cn.geckos.crazyas.debug
{
    import cn.geckos.crazyas.errors.AssertionError;
    
	/**
	 * @param expression 要进行断言的表达式
	 * @param message 当 expression 为 false 时抛出异常所附的消息
	 * @throws cn.geckos.crazyas.errors.AssertionError 当 expression 为 false时抛出异常。
	 */
    public function assert(expression:Boolean, message:String=null):void
    {
        if( !Debug.assertEnabled ) {
            return;
        }
        
        if( expression == false ) {
            throw new AssertionError(message);
        }
    }
    
}