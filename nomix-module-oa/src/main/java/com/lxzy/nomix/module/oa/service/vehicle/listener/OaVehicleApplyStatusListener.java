package com.lxzy.nomix.module.oa.service.vehicle.listener;

import com.lxzy.nomix.module.oa.service.vehicle.OaVehicleApplyService;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;

/**
 * 用车申请审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaVehicleApplyStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaVehicleApplyService vehicleApplyService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.VEHICLE_APPLY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        vehicleApplyService.updateVehicleApplyStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }

}
