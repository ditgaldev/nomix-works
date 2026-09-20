package com.lxzy.nomix.module.oa.service.resign.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.resign.OaResignApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 离职申请审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaResignApplyStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaResignApplyService resignApplyService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.RESIGN_APPLY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        resignApplyService.updateResignApplyStatus(Long.valueOf(event.getBusinessKey()), event.getStatus());
    }

}
