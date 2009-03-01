package cn.geckos.crazyas.net
{
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.FileReference;
import flash.net.URLRequest;

public class SequenceFileUploader extends EventDispatcher
{
    private var _files:Array = [];
    
    public function get length():int
    {
        return _files.length;
    }
    
    private var _requests:Array = [];
    
    private var _uploadingFile:FileReference;
    public function get uploadFile():FileReference
    {
        return _uploadingFile;
    }
    
    private var _running:Boolean;
    public function get running():Boolean
    {
        return _running;
    }
    
    /**
     * Constructor
     * 
     */
    public function SequenceFileUploader()
    {
    }
    
    public function startUpload():void
    {
        if( !running ) {
            _running = true; 
            run();
        } 
    }
    
    
    protected function run():void
    {
        if( !running ) {
            return;
        }
        
        if( _files.length < 1 ) {
            _running = false;
            _uploadingFile = null;
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }
        else {
            _uploadingFile = _files.shift();
            _uploadingFile.addEventListener(Event.COMPLETE,
                function(e:Event):void{ run(); }
            );
            
            var data:Object = _requests.shift();
            _uploadingFile.upload(URLRequest(data['request']), data['fieldName']);
            
            dispatchEvent(new Event(Event.CHANGE));
        }
    }
    
    public function addFile(file:FileReference, uploadRequest:URLRequest, fieldName:String):void
    {
        _files.push(file);
        _requests.push({
	          'request': uploadRequest,
            'fieldName': fieldName
        });
    }
    
    public function removeFile(file:FileReference):void
    {
        var index:int = _files.indexOf(file);
        if( index > -1 ) {
            var file:FileReference = FileReference( _files[index] );
            _files.splice(index, 1);
            _requests.splice(index, 1);
            
            // TODO
            if( file == _uploadingFile ) {
                file.cancel();
                run();
            }
        }
    }
        
}
}