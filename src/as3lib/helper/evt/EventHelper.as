package as3lib.helper.evt
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * 事件控制枢纽
	 */
	public class EventHelper
	{
		public static const REGISTER:String = "register";
		protected static var m_oInstance:EventHelper;
		protected var dispatcherDicionary:Object = {};
		/**
		 * 单例模式
		 */
		public static function getInstance():EventHelper
		{
			if(!m_oInstance)
			{
				m_oInstance = new EventHelper();
			}
			return m_oInstance;
		}

		/**
		 * @param key 
		 * @param dispatcher 触发器(建议直接使用modulebase)
		 */
		public function register(key:String,dispatcher:IEventDispatcher):void
		{
			var visualDispatcher:VisualDispatcher = dispatcherDicionary[key] as VisualDispatcher;
			if(visualDispatcher)
			{
				visualDispatcher.toExtend(dispatcher);
				dispatcher.dispatchEvent(new Event(REGISTER));
			}
			dispatcherDicionary[key] = dispatcher;
		}
		/**
		 * 获取触发器
		 */
		public function get(key:String):IEventDispatcher
		{
			if(dispatcherDicionary[key] == null)
			{
				dispatcherDicionary[key] = new VisualDispatcher();
			}
			return dispatcherDicionary[key];
		}
		/**
		 * 删除触发器（删除并不会删除对象，只是从一个集合中断开链接）
		 */
		public function remove(key:String):void
		{
			delete dispatcherDicionary[key];
		}
		/**
		 * 删除所有触发器
		 */
		public function removeAll():void
		{
			dispatcherDicionary = {};
		}
		
		
	}
}