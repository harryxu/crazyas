package cn.geckos.utils
{
public class Config
{
    private static const data:Object = {};
    private static const tags:Object = {};
    
    /**
     * 
     * @param key
     * @return 
     * 
     */
    public static function getValue(key:String):Object
    {
        if( !isset(data[key]) ) {
            return null;
        }
        return data[key].value;
    }
    
    /**
     * 
     * @param tag
     * @return 
     * 
     */
    public static function getValuesByTag(tag:String):Object
    {
        if( !isset(tags[tag]) ) {
            return null;
        }
        
        var values:Object = tags[tag];
        var clone:Object = {};
        for each( var key:String in values ) {
            clone[key] = values[key];
        }
        return clone;
    }
    
    /**
     * 
     * @param key
     * @param value
     * @param tags
     * 
     */
    public static function setValue(value:Object, key:String, ...tags):void
    {
        var len:Number = tags.length;
        for( var i:Number=0; i<len; i++ ) {
            var tag:String = Object(tags[i]).toString();
            if( !isset(tags[tag]) ) {
                Config.tags[tag] = {};
            }
            Config.tags[tag][key] = value;
        }
        data[key] = {'value':value, 'tags':tags};
    }
    
    /**
     * 
     * @param key
     */
    public static function remove(key:String):void
    {
        if( isset(data[key]) ) {
            var tags:Array = data[key].tags;
            for each(var tag:String in tags) {
                removeTag(tag, key);
            }
            delete data[key];
        }
    }
    
    /**
     * 
     * @param tag
     * @param key
     */
    public static function removeTag(tag:String, key:String):void
    {
        if( isset(Config.tags[tag]) && isset(data[key]) ) {
            var tags:Array = data[key].tags as Array;
            var index:int = tags.indexOf(tag);
            if( index > -1 ) {
                tags.splice(index, 1);
            }
            delete Config.tags[tag][key];
        }
    }
    
    /**
     * 
     * @param tag
     * @param key
     * @return 
     * 
     */
    public static function setTag(tag:String, key:String):Boolean
    {
        if( !isset(data[key]) ) {
            return false;
        }
        
        var tags:Array = data[key].tags;
        if( isset(Config.tags[tag]) && isset(Config.tags[tag][key]) ) {
            return true;
        }
        
        tags.push(tag);
        if( !isset(Config.tags[tag]) ) {
            Config.tags[tag] = {};
        }
        Config.tags[tag][key] = getValue(key);
        return true;
    }
    
    /**
     * 
     * @param vari
     * @return 
     * 
     */
    public static function isset(vari:*):Boolean
    {
        return vari != null;
    }
}
}
