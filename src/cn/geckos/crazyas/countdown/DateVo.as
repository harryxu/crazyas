package cn.geckos.crazyas.countdown {
public class DateVo {
    
    public var days:Number;
    public var hours:Number;
    public var minutes:Number;
    public var seconds:Number;
    public var milliseconds:Number;
    
    public function DateVo(days:Number=0, hours:Number=0, minutes:Number=0,
                           seconds:Number=0, milliseconds:Number=0){
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
