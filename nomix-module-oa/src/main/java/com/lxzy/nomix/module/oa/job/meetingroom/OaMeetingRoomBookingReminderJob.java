package com.lxzy.nomix.module.oa.job.meetingroom;

import cn.hutool.core.util.StrUtil;
import com.lxzy.nomix.framework.quartz.core.handler.JobHandler;
import com.lxzy.nomix.framework.tenant.core.job.TenantJob;
import com.lxzy.nomix.module.oa.service.meetingroom.OaMeetingRoomBookingService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

// TODO @AI：是不是分开 job 噢？因为毕竟是 remind；
/**
 * OA 会议开始提醒与过期预定处理 Job
 *
 * @author Nomix源码
 */
@Component
public class OaMeetingRoomBookingReminderJob implements JobHandler {

    @Resource
    private OaMeetingRoomBookingService meetingRoomBookingService;

    @Override
    @TenantJob
    public String execute(String param) {
        int expiredCount = meetingRoomBookingService.cancelExpiredMeetingRoomBookings();
        int count = meetingRoomBookingService.sendMeetingRoomBookingReminders();
        return StrUtil.format("取消过期未开始会议 {} 条，发送会议提醒 {} 条", expiredCount, count);
    }

}
