/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package {{url}}
{
    import com.yile.framework.net.IResponse;
    import com.yile.games.doll.net.vo.*;
    import com.yile.framework.net.Packet;

    /*@import*/

    /**
     * {{info}}({{cmdIndex}}:{{paramIndex}})
     */
    public class {{responseClassName}} implements IResponse
    {
        {{#attribList}}
    	/**
    	 * {{info}}
    	 */
    	public var {{value}}:{{type}};
    	
        {{/attribList}}

        public function read(p:Packet):void
        {
    		{{#attribList}}
    		
			{{#isArrayValue}}
			for(var {{indexName}}:int = 0; {{indexName}} < {{lenName}}; {{indexName}}++)
			{
				{{value}} = [];
				
				{{#{{type}}}}
				
				{{/{{type}}}}

			}
			{{/isArrayValue}}
			
			{{#isVOType}}
			{{value}} = new {{type}}();
			
			{{/isVOType}}
			
			{{#isSimple}}
			{{value}} = p.{{readType}};
			{{/isSimple}}
			
			{{/attribList}}
		}
    }
}