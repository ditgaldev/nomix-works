package com.lxzy.nomix.module.oa.service.officialdoc.listener;

import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEvent;
import com.lxzy.nomix.module.bpm.api.event.BpmProcessInstanceStatusEventListener;
import com.lxzy.nomix.module.oa.enums.BpmModelConstants;
import com.lxzy.nomix.module.oa.service.officialdoc.OaOfficialDocReceiveService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 公文收文审批结果监听器
 *
 * @author Nomix源码
 */
@Component
public class OaOfficialDocReceiveStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private OaOfficialDocReceiveService officialDocReceiveService;

    @Override
    protected String getProcessDefinitionKey() {
        return BpmModelConstants.OFFICIAL_DOC_RECEIVE;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        officialDocReceiveService.updateOfficialDocReceiveStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }

}
