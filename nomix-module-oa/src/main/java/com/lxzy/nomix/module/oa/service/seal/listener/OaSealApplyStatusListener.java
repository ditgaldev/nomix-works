package com.lxzy.nomix.module.oa.service.seal.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.seal.OaSealApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 用印申请审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaSealApplyStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaSealApplyService sealApplyService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.SEAL_APPLY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        sealApplyService.updateSealApplyStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }

}
