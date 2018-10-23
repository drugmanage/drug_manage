/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/fast">JeeSite</a> All rights reserved.
 */
package com.thinkgem.fast.common.supcan.freeform;

import com.thinkgem.fast.common.supcan.common.Common;
import com.thinkgem.fast.common.supcan.common.properties.Properties;
import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 硕正FreeForm
 * @author WangZhen
 * @version 2013-11-04
 */
@XStreamAlias("FreeForm")
public class FreeForm extends Common {

	public FreeForm() {
		super();
	}
	
	public FreeForm(Properties properties) {
		this();
		this.properties = properties;
	}
	
}
