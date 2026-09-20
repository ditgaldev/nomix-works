package com.lxzy.nomix.module.oa.job.schedule;

import cn.hutool.core.util.StrUtil;
import com.lxzy.nomix.framework.quartz.core.handler.JobHandler;
import com.lxzy.nomix.framework.tenant.core.job.TenantJob;
import com.lxzy.nomix.module.oa.service.schedule.OaScheduleService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * OA 日程提醒 Job
 *
 * @author Nomix源码
 */
@Component
public class OaScheduleReminderJob implements JobHandler {

    @Resource
    private OaScheduleService scheduleService;

    @Override
    @TenantJob
    public String execute(String param) {
        int count = scheduleService.sendScheduleReminders();
        return StrUtil.format("发送日程提醒 {} 条", count);
    }

}
