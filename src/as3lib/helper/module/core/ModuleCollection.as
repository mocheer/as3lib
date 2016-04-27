/**
 * 创建：trg
 * 日期：2011-11-02
 * 功能：自定义键值对集合类，要求键不能为 null 或 0 长度字符串。
 */
package as3lib.helper.module.core 
{
	/**
	 * 键值对集合，要求键不能为 null 或 0 长度字符串。
	 * @author trg
	 */
	public class ModuleCollection 
	{
		private var m_oDataArray:Array = [];
		private var m_oKeyArray:Array = [];
		
		public function ModuleCollection() 
		{
			
		}
		
		//================================================== 属性部分 ============================================
		/**
		 * 获取键值数
		 */
		public function get count():int {
			return m_oKeyArray.length;
		}
		
		//================================================== 方法部分 ============================================
		/**
		 * 添加数据项
		 * @param	key	键，必须唯一，不能为 null 或空字符串。
		 * @param	obj	键值对象
		 */
		public function add(key:String, obj:*) : void {
			checkKey(key);
			
			if (m_oKeyArray.indexOf(key) > -1) {
				throw new Error("已存在键值为 [" + key + "] 的数据！");
			}
			m_oKeyArray.push(key);
			m_oDataArray.push(obj);
		}
		
		/**
		 * 清理所有数据项
		 */
		public function clear():void {
			m_oKeyArray = [];
			m_oDataArray = [];
		}
		
		private function checkKey(key:String) : void {
			if (key == null || key == "") {
				throw new Error("键名不能为空或空字符串！");
			}
		}
		
		/**
		 * 检索是否存在特定键值
		 * @param	key
		 * @return
		 */
		public function contains(key:String):Boolean {
			return (m_oKeyArray.indexOf(key) > -1);
		}
		
		/**
		 * 获取键值对应的数据对象。
		 * @param	key	键值
		 * @return	数据对象。
		 */
		public function get(key:String):* {
			checkKey(key);
			var _iIndex:int = m_oKeyArray.indexOf(key);
			if (_iIndex < 0) {
				return null;
			}
			return m_oDataArray[_iIndex];
		}
		
		/**
		 * 获取位于指定索引处的键值
		 * @param	index
		 * @return
		 */
		public function getAt(index:int):* {
			return m_oDataArray[index];
		}
		
		/**
		 * 获取键值对应的键。
		 * @param	obj	键值对象
		 * @return	如果知道，则为对应的键。否则返回 null。
		 */
		public function getKey(obj:*):String {
			var index:int = m_oDataArray.indexOf(obj);
			if (index > -1) {
				return m_oKeyArray[index];
			}
			return null;
		}
		
		/**
		 * 获取键值对应的索引
		 * @param	key	键值
		 * @return	对应的索引
		 */
		public function indexOf(key:String):int {
			return m_oKeyArray.indexOf(key);
		}
		
		/**
		 * 删除键值为 key 的数据，并返回。如果未找到，则返回 null。
		 * @param	key	待删除的数据的键值
		 * @return	如果删除成功，则返回该key对应的值，否则返回null。
		 */
		public function remove(key:String):* {
			var _iIndex:int = indexOf(key);
			if (_iIndex > -1) {
				m_oKeyArray.splice(_iIndex, 1);
				return m_oDataArray.splice(_iIndex, 1)[0];
			}
			else {
				return null;
			}
		}
		
		/**
		 * 删除索引为 index 的数据，返回键值
		 * @param	index	索引
		 * @return	位于索引 index 处的键值
		 */
		public function removeAt(index:int) : * {
			if (index >= m_oDataArray.length) { 
				return null;
			}
			m_oKeyArray.splice(index, 1);
			return m_oDataArray.splice(index, 1)[0];
		}
		
		/**
		 * 为键值为 key 的项设置值
		 * @param	key	键值
		 * @param	obj	数据对象
		 */
		public function set(key:String, obj:*) : void {
			checkKey(key);
			var _iIndex:int = indexOf(key);
			if (_iIndex > -1) {
				m_oDataArray[_iIndex] = obj;
			}
			else {
				add(key, obj);
			}
		}
	}
}