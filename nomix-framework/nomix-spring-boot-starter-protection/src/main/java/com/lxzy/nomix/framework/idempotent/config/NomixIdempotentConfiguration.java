package com.lxzy.nomix.framework.idempotent.config;

import com.lxzy.nomix.framework.idempotent.core.aop.IdempotentAspect;
import com.lxzy.nomix.framework.idempotent.core.keyresolver.impl.DefaultIdempotentKeyResolver;
import com.lxzy.nomix.framework.idempotent.core.keyresolver.impl.ExpressionIdempotentKeyResolver;
import com.lxzy.nomix.framework.idempotent.core.keyresolver.IdempotentKeyResolver;
import com.lxzy.nomix.framework.idempotent.core.keyresolver.impl.UserIdempotentKeyResolver;
import com.lxzy.nomix.framework.idempotent.core.redis.IdempotentRedisDAO;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import com.lxzy.nomix.framework.redis.config.NomixRedisAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.List;

@AutoConfiguration(after = NomixRedisAutoConfiguration.class)
public class NomixIdempotentConfiguration {

    @Bean
    public IdempotentAspect idempotentAspect(List<IdempotentKeyResolver> keyResolvers, IdempotentRedisDAO idempotentRedisDAO) {
        return new IdempotentAspect(keyResolvers, idempotentRedisDAO);
    }

    @Bean
    public IdempotentRedisDAO idempotentRedisDAO(StringRedisTemplate stringRedisTemplate) {
        return new IdempotentRedisDAO(stringRedisTemplate);
    }

    // ========== 各种 IdempotentKeyResolver Bean ==========

    @Bean
    public DefaultIdempotentKeyResolver defaultIdempotentKeyResolver() {
        return new DefaultIdempotentKeyResolver();
    }

    @Bean
    public UserIdempotentKeyResolver userIdempotentKeyResolver() {
        return new UserIdempotentKeyResolver();
    }

    @Bean
    public ExpressionIdempotentKeyResolver expressionIdempotentKeyResolver() {
        return new ExpressionIdempotentKeyResolver();
    }

}
