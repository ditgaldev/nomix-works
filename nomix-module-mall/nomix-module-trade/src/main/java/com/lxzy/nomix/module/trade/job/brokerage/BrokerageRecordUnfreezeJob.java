package com.lxzy.nomix.module.trade.job.brokerage;

import cn.hutool.core.util.StrUtil;
import com.lxzy.nomix.framework.quartz.core.handler.JobHandler;
import com.lxzy.nomix.framework.tenant.core.job.TenantJob;
import com.lxzy.nomix.module.trade.service.brokerage.BrokerageRecordService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 佣金解冻 Job
 *
 * @author owen
 */
@Component
public class BrokerageRecordUnfreezeJob implements JobHandler {

    @Resource
    private BrokerageRecordService brokerageRecordService;

    @Override
    @TenantJob
    public String execute(String param) {
        int count = brokerageRecordService.unfreezeRecord();
        return StrUtil.format("解冻佣金 {} 个", count);
    }

}
