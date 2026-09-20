package com.lxzy.nomix.module.iot.gateway.config;

import com.lxzy.nomix.module.iot.gateway.protocol.IotProtocolManager;
import com.lxzy.nomix.module.iot.gateway.serialize.IotMessageSerializerManager;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * IoT 网关配置类
 *
 * @author Nomix
 */
@Configuration
@EnableConfigurationProperties(IotGatewayProperties.class)
public class IotGatewayConfiguration {

    @Bean
    public IotMessageSerializerManager iotMessageSerializerManager() {
        return new IotMessageSerializerManager();
    }

    @Bean
    public IotProtocolManager iotProtocolManager(IotGatewayProperties gatewayProperties) {
        return new IotProtocolManager(gatewayProperties);
    }

}
