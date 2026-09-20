package com.lxzy.nomix.module.trade.framework.web.config;

import com.lxzy.nomix.framework.swagger.config.NomixSwaggerAutoConfiguration;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * trade 模块的 web 组件的 Configuration
 *
 * @author Nomix源码
 */
@Configuration(proxyBeanMethods = false)
public class TradeWebConfiguration {

    /**
     * trade 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi tradeGroupedOpenApi() {
        return NomixSwaggerAutoConfiguration.buildGroupedOpenApi("trade");
    }

}
