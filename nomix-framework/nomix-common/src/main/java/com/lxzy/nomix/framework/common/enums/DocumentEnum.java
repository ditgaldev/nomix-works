package com.lxzy.nomix.framework.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文档地址
 *
 * @author Nomix源码
 */
@Getter
@AllArgsConstructor
public enum DocumentEnum {

    REDIS_INSTALL("https://github.com/ditgaldev/nomix-works/issues/I4VCSJ", "Redis 安装文档"),
    TENANT("https://doc.nomix.cn", "SaaS 多租户文档");

    private final String url;
    private final String memo;

}
