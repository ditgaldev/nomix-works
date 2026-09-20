package com.lxzy.nomix.module.pms.framework.web.config;

import com.lxzy.nomix.framework.swagger.config.NomixSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * PMS 模块的 Web 配置
 *
 * @author Nomix
 */
@Configuration(proxyBeanMethods = false)
public class PmsWebConfiguration {

    /**
     * 创建 PMS 模块的 OpenAPI 分组
     *
     * @return PMS OpenAPI 分组
     */
    @Bean
    public GroupedOpenApi pmsGroupedOpenApi() {
        return NomixSwaggerAutoConfiguration.buildGroupedOpenApi("pms");
    }

}
