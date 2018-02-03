package
{
   import flash.display.Sprite;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLLoaderDataFormat; 
   import flash.external.ExternalInterface;
   import flash.events.Event;
   
   public class re extends Sprite
   {
      
      public function re()
      {
		 var param:Object = root.loaderInfo.parameters;
         super();
		 var jsonStr:String = param["str"];
		 var hostUrl:String = param["host"];
		 var ctype:String = param["ctype"];
		 var m:String = param["method"];
         var url:String = hostUrl;
		 var dataSet:String="Null";
         var request:URLRequest = new URLRequest(url);
         request.requestHeaders.push(new URLRequestHeader("Content-Type",ctype));
		 request.method = URLRequestMethod.GET;
		 if(m!=null&&m=="POST"){
          request.method = URLRequestMethod.POST;
		  request.data = jsonStr;
		 }
         var urlLoader:URLLoader = new URLLoader();
		 urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
		 urlLoader.addEventListener(Event.COMPLETE, urlLoader_complete);
		 function urlLoader_complete(evt:Event):void {
         dataSet = urlLoader.data;
		 ExternalInterface.call("alert", dataSet);
		 }
         try
         {
            urlLoader.load(request);
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
   }
}