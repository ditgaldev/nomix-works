package com.lxzy.nomix.module.oa.service.regular.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.regular.OaRegularApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 转正申请审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaRegularApplyStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaRegularApplyService regularApplyService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.REGULAR_APPLY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        regularApplyService.updateRegularApplyStatus(Long.valueOf(event.getBusinessKey()), event.getStatus());
    }

}
