package ui
{
	import com.yo.mvc.core.BaseModel;
	
	import mx.collections.XMLListCollection;
	import mx.controls.MenuBar;

	public class WorkModel extends BaseModel
	{
		public static var menuXML:XMLList = 
		<>
			<menu label="文件" data="top">
				<menuitem label="新建" data="create"/>
				<menuitem label="打开" data="open"/>
				<menuitem label="保存" data="save" enabled="false"/>
				<menuitem label="导出" data="export" enabled="false"/>
				<menuitem type="separator" data="separator"/>
				<menuitem label="设定" data="setting"/>
				<menuitem label="退出" data="exit"/>
				<menuitem label="生成格子" data="tile_build"/>
			</menu>
			<menu label="编辑" data="top">
				<menuitem label="编辑传送门" data="goods_edit"/>
				<menuitem label="编辑NPC" data="npc_edit"/>
				<menuitem label="编辑装饰物" data="decoration_edit"/>
				<menuitem label="编辑背景装饰物" data="bg_decoration_edit"/>
			</menu>
			<menu label="功能" data="top">
				<menuitem label="动画导出器" data="animator"/>
				<menuitem label="批量动画导出器" data="batch_animator"/>
				<menuitem label="动画查看器" data="animator_view"/>
				<menuitem label="纸娃娃导出器" data="avatar_exporter"/>
				<menuitem type="separator"/>
				<menuitem label="技能编辑器" data="skill_edit"/>
				<menuitem label="场景编辑器" data="main" type="check" toggled="true"/>
				<menuitem label="地图切割器" data="map_carve"/>
			</menu>
			<menu label="帮助" data="top">
				<menuitem label="关于" data="about"/>
			</menu>
		</>;
		
		public function WorkModel()
		{
		}
	}
}