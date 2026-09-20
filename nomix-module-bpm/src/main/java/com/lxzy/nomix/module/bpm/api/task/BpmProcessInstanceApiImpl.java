package com.lxzy.nomix.module.bpm.api.task;

import com.lxzy.nomix.module.bpm.api.task.dto.BpmProcessInstanceCreateReqDTO;
import com.lxzy.nomix.module.bpm.controller.admin.task.vo.instance.BpmProcessInstanceCancelReqVO;
import com.lxzy.nomix.module.bpm.service.task.BpmProcessInstanceService;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * Flowable 流程实例 Api 实现类
 *
 * @author Nomix
 * @author jason
 */
@Service
@Validated
public class BpmProcessInstanceApiImpl implements BpmProcessInstanceApi {

    @Resource
    private BpmProcessInstanceService processInstanceService;

    @Override
    public String createProcessInstance(Long userId, @Valid BpmProcessInstanceCreateReqDTO reqDTO) {
        return processInstanceService.createProcessInstance(userId, reqDTO);
    }

    @Override
    public void cancelProcessInstanceByStartUser(Long userId, String processInstanceId, String reason) {
        processInstanceService.cancelProcessInstanceByStartUser(userId,
                new BpmProcessInstanceCancelReqVO().setId(processInstanceId).setReason(reason));
    }

}
