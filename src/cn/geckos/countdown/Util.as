package cn.geckos.countdown {
    
public class Util {
    
    /**
     * 获取两个日期之间的天数
     */ 
    public static function getDayCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_DAY;
    }
    
    /**
     * 获取两个日期之间的小时数
     */ 
    public static function getHourCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_HOUR;
    }
    
    /**
     * 获取两个日期之间的分钟数
     */ 
    public static function getMinuteCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_MINUTE;
    }
    
    /**
     * 获取两个日期之间的秒数
     */ 
    public static function getSecondCount(destination:Date, ref:Date=null):Number {
        return getMillisecondCount(destination, ref) / Const.MILLISECONDS_PER_SECOND;
    }
    
    /**
     * 获取两个日期之间的毫秒数
     */ 
    public static function getMillisecondCount(destination:Date, ref:Date=null):Number {
        if(!ref)
            ref = new Date();

        return destination.time - ref.time;
    }
}
}