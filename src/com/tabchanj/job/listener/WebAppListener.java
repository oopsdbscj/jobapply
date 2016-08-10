package com.tabchanj.job.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tabchanj.job.util.Global;
import com.tabchanj.job.util.LuceneUtils;

public class WebAppListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		LuceneUtils.closeIndexWriter();
	}

	/**
	 * 在容器启动时,初始化项目根目录常量
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
		Global.webAppPath = event.getServletContext().getRealPath("/");
	}

}
