package cn.geckos.utils
{
public class StringFormat
{
    
    private static var specialSigns:Array = [
        '&', '&amp;',
        '<', '&lt;',
        '>', '&gt;',
        '"', '&quot;',
        '®', '&reg;',
        '©', '&copy;',
        '™', '&trade;',
    ];
    
    /**
     * 替用html实体换掉字符窜中的特殊字符
     * @param str
     * @return 
     * 
     */
    public static function htmlTrans(str:String):String
    {
        var len:Number = specialSigns.length;
        for( var i:Number = 0; i < len; i += 2 )
        {
            var from:String = specialSigns[i];
            var to:String = specialSigns[i+1];
            str = str.replace(from, to);
        }
        
        return str;
    }
    
    /**
     * 给数字字符前面添 "0"
     * 
     * <pre> 
     * 
     * trace( StringFormat.zfill('1') );
     * // 01
     * 
     * trace( StringFormat.zfill('16', 5) );
     * // 00016
     * 
     * trace( StringFormat.zfill('-3', 3) );
     * // -03
     * 
     * </pre>
     * 
     * @param str 要进行处理的字符串
     * @param width 处理后字符串的长度，
     *              如果str.length >= width，将不做任何处理直接返回原始的str。
     * @return 
     * 
     */
    public static function zfill(str:String, width:uint = 2):String
    {
        if( !str ) {
            str;
        }
        
        var slen:Number = str.length;
        if( slen >= width ) {
            return str;
        }
        
        var negative:Boolean = false;
        if( str.substr(0, 1) == '-' ) {
            negative = true;
            str = str.substr(1);
        }
        
        var len:Number = width - slen;
        for( var i:Number = 0; i < len; i++ )
        {
            str = '0' + str;
        }
        
        if( negative ) {
            str = '-' + str;
        }
        
        return str;
    }
    
    /**
     * 字符变量替换
     * 用 args中的变量值替换掉 str 中的占位符，
     * args 有2种方式，一种是直接在 str 后跟任意个数的字符串参数，
     * 占位符用 类似 {0}, {1} ... 表示，之后分别会被 str 后的的参数替换 
     * 
     * args 还可以是一个对象，但这时候占位符花括号间可以是对象的属性名
     * 类似 {name} ，这样就会被args[0].name 替换
     * 
     * <pre>
     * 
     * var s:String = 'name is {0}, age is {1}.';
     * trace( StringFormat.format(s, 'harry', '23') );
     * // name is harry, age is 23.
     * 
     * s = 'flash is a {type}, which use {lang}, aha, \\{test\\}';
     * trace( StringFormat.format(s, {'type':'software', 'lang':'ActionScript'}) );
     * // flash is a software, which use ActionScript, aha, {test}
     * 
     * </pre>
     * 
     * @param str 要进行格式化的字符串
     * @param args 替换str中占位符的参数
     * @return 格式化后的字符串
     * 
     */
    public static function format(str:String, ...args):String
    {
        if( !args || args.length==0 ) {
            return str;
        }
        
        var isDictArg:Boolean = false;
        var sArgs:Object = args;
        if( !(args[0] is String) ) {
            sArgs = args[0];
            isDictArg = true;
        }
        
        var regex:RegExp = /(?<!\\)(\{[^{}]*[^\\]\})/gim;
        var result:Array = str.match( regex );
        
        for each( var s:String in result )
        {
            var key:* = s.substring(1, s.length-1);
            if( !isDictArg ) {
                key = Number(key);
            }
            
            s = s.replace(/[{}]/g, '\\$&');
            str = str.replace(new RegExp(s), sArgs[key]);
        }
        
        str = str.replace(/\\{/gm, '{');
        str = str.replace(/\\}/gm, '}');
        
        return str;
    }

}
}
