package com.lxzy.nomix.module.oa.service.travel.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.travel.OaTravelReimbursementService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 出差报销审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaTravelReimbursementStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaTravelReimbursementService travelReimbursementService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.TRAVEL_REIMBURSEMENT;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        travelReimbursementService.updateTravelReimbursementStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }

}
