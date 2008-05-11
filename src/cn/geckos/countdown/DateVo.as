package cn.geckos.countdown {
public class DateVo {
    
    public var days:Number;
    public var hours:Number;
    public var minutes:Number;
    public var seconds:Number;
    public var milliseconds:Number;
    
    public function DateVo(days:Number=NaN, hours:Number=NaN, minutes:Number=NaN,
                           seconds:Number=NaN, milliseconds:Number=NaN){
        this.days = days;
        this.hours = hours;
        this.minutes = minutes;
        this.seconds = seconds;
        this.milliseconds = milliseconds;
    }
    
    public function value(v:*):* {
        
        if(v==null || v==undefined)
            return ''
        return v;
    }
    
    public function toString():String {
        return [value(days), value(hours), value(minutes),
                value(seconds), value(milliseconds)].join(', ');
    }

}
}