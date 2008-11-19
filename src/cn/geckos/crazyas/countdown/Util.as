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
     * 
     * @param destination 时间点1
     * @param ref 时间点2 [可选] 默认为当前时间
     * @return 两个时间点相差的毫秒数
     */ 
    public static function getMillisecondCount(destination:Date, ref:Date=null):Number {
        if(!ref)
            ref = new Date();

        return Math.abs(destination.time - ref.time);
    }
    
    /**
     * 比较两个时间点
     *
     * @param destination 时间点1
     * @param ref 时间点2 [可选] 默认为当前时间
     * @return 如果destination 比 ref 晚 返回1， 如果destination 比 ref早 返回 -1，
     *         返回 0 表示两个时间点相同。
     */ 
    public static function compareDate(destination:Date, ref:Date=null):int {
        if(!ref)
            ref = new Date();
        
        var m:Number = destination.time - ref.time;
        
        if(m > 0)
            return 1;
        else if(m == 0)
            return 0;
            
        return -1;
    }
}
}