package com.lxzy.nomix.module.product.framework.web.config;

import com.lxzy.nomix.framework.swagger.config.NomixSwaggerAutoConfiguration;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * product 模块的 web 组件的 Configuration
 *
 * @author Nomix源码
 */
@Configuration(proxyBeanMethods = false)
public class ProductWebConfiguration {

    /**
     * product 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi productGroupedOpenApi() {
        return NomixSwaggerAutoConfiguration.buildGroupedOpenApi("product");
    }

}
