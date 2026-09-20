package com.lxzy.nomix.module.system.service.logger;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.common.biz.system.logger.dto.OperateLogCreateReqDTO;
import com.lxzy.nomix.module.system.api.logger.dto.OperateLogPageReqDTO;
import com.lxzy.nomix.module.system.controller.admin.logger.vo.operatelog.OperateLogPageReqVO;
import com.lxzy.nomix.module.system.dal.dataobject.logger.OperateLogDO;

/**
 * 操作日志 Service 接口
 *
 * @author Nomix源码
 */
public interface OperateLogService {

    /**
     * 记录操作日志
     *
     * @param createReqDTO 创建请求
     */
    void createOperateLog(OperateLogCreateReqDTO createReqDTO);

    /**
     * 获得操作日志
     *
     * @param id 编号
     * @return 操作日志
     */
    OperateLogDO getOperateLog(Long id);

    /**
     * 获得操作日志分页列表
     *
     * @param pageReqVO 分页条件
     * @return 操作日志分页列表
     */
    PageResult<OperateLogDO> getOperateLogPage(OperateLogPageReqVO pageReqVO);

    /**
     * 获得操作日志分页列表
     *
     * @param pageReqVO 分页条件
     * @return 操作日志分页列表
     */
    PageResult<OperateLogDO> getOperateLogPage(OperateLogPageReqDTO pageReqVO);

}
