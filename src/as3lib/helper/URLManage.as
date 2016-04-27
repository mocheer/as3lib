package as3lib.helper
{
	    import flash.external.ExternalInterface;
	    import flash.utils.Dictionary;
	    import flash.utils.getQualifiedClassName;       
	    /**
	     * Singleton used to grab data out of the query string.
		 * 一个单例类，用来获取URL地址后所带参数值对
	     * @author Matt Przybylski [http://www.reintroducing.com]
 		 * @version 1.1
		 */
		public class URLManage
		{
		    //=======================================属性=====================================
	        private static var _instance:URLManage;
	        private static var _allowInstance:Boolean;
	        private var _pairDict:Dictionary;
		    private var _url:String;
	        private var _pairs:Array;
			
			public function URLManage() 
			{
				this.parseValues();
				if (!URLManage._allowInstance)
				{
					throw new Error("Error: Use QueryString.getInstance() instead of the new keyword.");
				}
			}      
			
	       // singleton instance of QueryString
	    	public static function getInstance():URLManage 
	        {
		        if(URLManage._instance == null)
		         {
	                URLManage._allowInstance = true;
	                URLManage._instance = new URLManage();
	                URLManage._allowInstance = false;
		         }            
		        return URLManage._instance;
	        }
	       
	        
		  //=============================================方法========================================
		    private function parseValues():void
	    	{
	             this._url = ExternalInterface.call("document.location.search.toString");
	             this._pairDict = new Dictionary(true);
	             this._pairs = this._url.split("?")[1].split("&");
			   
	             var pairName:String;
	             var pairValue:String;
	            
	           for (var i:int = 0; i <this._pairs.length; i++)
	           {
	                pairName = this._pairs[i].split("=")[0];
	                pairValue = this._pairs[i].split("=")[1];
		                
	                this._pairDict[pairName] = pairValue;
	           }
		 	}
			    
		    public function getValue($val:String):String
		    {
		         if (this._pairDict[$val] == null)
			     {
				     return "";
				 }
		         else
		         {
			         return this._pairDict[$val];
			     }
			 }
	    
		//- HELPERS ============================================================================
	        public function toString():String
	        {
		            return getQualifiedClassName(this);
		    }
		//=====================================END CLASS =======================================
	    }
	}