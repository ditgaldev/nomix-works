package com.lxzy.nomix.module.wms.framework.web.config;

import com.lxzy.nomix.framework.swagger.config.NomixSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * WMS 模块的 web 组件的 Configuration
 *
 * @author Nomix
 */
@Configuration(proxyBeanMethods = false)
public class WmsWebConfiguration {

    /**
     * WMS 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi wmsGroupedOpenApi() {
        return NomixSwaggerAutoConfiguration.buildGroupedOpenApi("wms");
    }

}
