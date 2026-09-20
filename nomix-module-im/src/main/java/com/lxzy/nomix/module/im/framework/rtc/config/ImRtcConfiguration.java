package com.lxzy.nomix.module.im.framework.rtc.config;

import com.lxzy.nomix.module.im.framework.config.ImProperties;
import com.lxzy.nomix.module.im.framework.rtc.core.LiveKitClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * im 模块的 RTC 组件的 Configuration
 *
 * @author Nomix
 */
@Configuration(proxyBeanMethods = false)
public class ImRtcConfiguration {

    /**
     * LiveKit 客户端
     */
    @Bean
    public LiveKitClient liveKitClient(ImProperties imProperties) {
        return new LiveKitClient(imProperties);
    }

}
