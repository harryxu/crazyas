package cn.geckos.countdown {
    
public class CountDown{
    
    
    public var destination:Date;
    public var ref:Date;
    
    public function CountDown(destination:Date, ref:Date=null) {
        this.destination = destination;
        this.ref = ref || new Date();
    }
    
    /**
     * 返回日期总数，向上取整
     */ 
    public function get dayCount():Number {
        return Math.ceil(Util.getDayCount(destination, ref));
    }
    
    /**
     * 返回总天数，向上取整
     */
    public function get hourCount():Number {
        return Math.ceil(Util.getHourCount(destination, ref));
    }
    
    /**
     * 返回总分钟数，向上取整
     */
    public function get minuteCount():Number {
        return Math.ceil(Util.getMillisecondCount(destination, ref));
    }
    
    /**
     * 返回总秒数，向上取整
     */
    public function get secondCount():Number {
        return Math.ceil(Util.getSecondCount(destination, ref));
    }
    
    /**
     * 返回总毫秒数
     */
    public function get millisecondCount():Number {
        return Util.getMillisecondCount(destination, ref);
    }
    
    public function get dayVo():DateVo {
        var vo:DateVo = new DateVo();
        
        var d:Number = Math.floor(Util.getDayCount(destination, ref));
        vo.days = Math.floor(Util.getDayCount(destination, ref));
        
        var m:Number = millisecondCount - vo.days * Const.MILLISECONDS_PER_DAY;
        vo.hours = Math.floor(m / Const.MILLISECONDS_PER_HOUR);
        
        m = m - vo.hours * Const.MILLISECONDS_PER_HOUR;
        vo.minutes = Math.floor(m / Const.MILLISECONDS_PER_MINUTE);
        
        m = m - vo.minutes * Const.MILLISECONDS_PER_MINUTE;
        vo.seconds = Math.floor(m / Const.MILLISECONDS_PER_SECOND);
        
        vo.milliseconds = m - vo.seconds * Const.MILLISECONDS_PER_SECOND;
        
        return vo;
    }
    
    public function get hourVo():DateVo {
        var vo:DateVo = new DateVo();
        
        vo.hours = Math.floor(Util.getHourCount(destination, ref));
        
        var m:Number = millisecondCount - vo.hours * Const.MILLISECONDS_PER_HOUR;
        vo.minutes = Math.floor(m / Const.MILLISECONDS_PER_MINUTE);
        
        m = m - vo.minutes * Const.MILLISECONDS_PER_MINUTE;
        vo.seconds = Math.floor(m / Const.MILLISECONDS_PER_SECOND);
        
        vo.milliseconds = m - vo.seconds * Const.MILLISECONDS_PER_SECOND;
        
        return vo;
    }
    
    public function get minuteVo():DateVo {
        var vo:DateVo = new DateVo();
        
        vo.minutes = Math.floor(Util.getMinuteCount(destination, ref));
        
        var m:Number = m - vo.minutes * Const.MILLISECONDS_PER_MINUTE;
        vo.seconds = Math.floor(m / Const.MILLISECONDS_PER_SECOND);
        
        vo.milliseconds = m - vo.seconds * Const.MILLISECONDS_PER_SECOND;
        
        return vo;
    }
    
    public function get secondVo():DateVo {
        var vo:DateVo = new DateVo();
        
        vo.seconds = Math.floor(Util.getSecondCount(destination, ref));
        vo.milliseconds = millisecondCount - 
                            Const.MILLISECONDS_PER_SECOND * vo.seconds;
        
        return vo;
    }
    
    public function compare():int {
        return Util.compareDate(destination, ref);
    }
}
}