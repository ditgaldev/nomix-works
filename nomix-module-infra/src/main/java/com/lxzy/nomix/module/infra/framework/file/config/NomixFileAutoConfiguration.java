package com.lxzy.nomix.module.infra.framework.file.config;

import com.lxzy.nomix.module.infra.framework.file.core.client.FileClientFactory;
import com.lxzy.nomix.module.infra.framework.file.core.client.FileClientFactoryImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 文件配置类
 *
 * @author Nomix
 */
@Configuration(proxyBeanMethods = false)
public class NomixFileAutoConfiguration {

    @Bean
    public FileClientFactory fileClientFactory() {
        return new FileClientFactoryImpl();
    }

}
