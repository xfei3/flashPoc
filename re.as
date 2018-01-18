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
         var member1:Object = null;
         var myJson:String = null;
         super();
		 var jsonStr:String = param["str"];
         member1 = new Object();
         member1 = jsonStr;
         var myData:Object = member1;
         myJson = JSON.stringify(myData);
         myJson = JSON.stringify(myData);
         var url:String = "http://localhost:8080";
         var request:URLRequest = new URLRequest(url);
         request.requestHeaders.push(new URLRequestHeader("Content-Type","application/json"));
         request.data = myJson;
         request.method = URLRequestMethod.POST;
         var urlLoader:URLLoader = new URLLoader();

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
