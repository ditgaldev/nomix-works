package com.lxzy.nomix.module.oa.service.leave.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.leave.OaLeaveApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 请假申请审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaLeaveApplyStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaLeaveApplyService leaveApplyService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.LEAVE_APPLY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        leaveApplyService.updateLeaveApplyStatus(Long.valueOf(event.getBusinessKey()), event.getStatus());
    }

}
