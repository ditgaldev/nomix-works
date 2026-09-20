package com.lxzy.nomix.framework.mq.redis.config;

import com.lxzy.nomix.framework.mq.redis.core.RedisMQTemplate;
import com.lxzy.nomix.framework.mq.redis.core.interceptor.RedisMessageInterceptor;
import com.lxzy.nomix.framework.redis.config.NomixRedisAutoConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.List;

/**
 * Redis 消息队列 Producer 配置类
 *
 * @author Nomix
 */
@Slf4j
@AutoConfiguration(after = NomixRedisAutoConfiguration.class)
public class NomixRedisMQProducerAutoConfiguration {

    @Bean
    public RedisMQTemplate redisMQTemplate(StringRedisTemplate redisTemplate,
                                           List<RedisMessageInterceptor> interceptors) {
        RedisMQTemplate redisMQTemplate = new RedisMQTemplate(redisTemplate);
        // 添加拦截器
        interceptors.forEach(redisMQTemplate::addInterceptor);
        return redisMQTemplate;
    }

}
