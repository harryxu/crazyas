package cn.geckos.countdown {
    
public class Util {
    
    public static function getDayCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_DAY;
    }
    
    public static function getHourCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_HOUR;
    }
    
    public static function getMinuteCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_MINUTE;
    }
    
    public static function getSecondCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_SECOND;
    }
    
    public static function getMillisecondCount(destination:Date, ref:Date=null):Number {
        if(!ref)
            ref = new Date();

        return destination.time - ref.time;
    }
}
}