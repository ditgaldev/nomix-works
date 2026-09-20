package com.lxzy.nomix.module.oa.service.meetingroom.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.meetingroom.OaMeetingRoomBookingService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 会议室预定审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaMeetingRoomBookingStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaMeetingRoomBookingService meetingRoomBookingService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.MEETING_ROOM_BOOKING;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        meetingRoomBookingService.updateMeetingRoomBookingStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }
}
