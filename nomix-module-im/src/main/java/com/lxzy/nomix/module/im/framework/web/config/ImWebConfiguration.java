package com.lxzy.nomix.module.im.framework.web.config;

import com.lxzy.nomix.framework.swagger.config.NomixSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * im 模块的 web 组件的 Configuration
 */
@Configuration(proxyBeanMethods = false)
public class ImWebConfiguration {

    /**
     * im 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi imGroupedOpenApi() {
        return NomixSwaggerAutoConfiguration.buildGroupedOpenApi("im");
    }

}
