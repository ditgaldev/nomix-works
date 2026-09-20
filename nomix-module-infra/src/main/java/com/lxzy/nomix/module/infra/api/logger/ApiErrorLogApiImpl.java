package com.lxzy.nomix.module.infra.api.logger;

import com.lxzy.nomix.framework.common.biz.infra.logger.ApiErrorLogCommonApi;
import com.lxzy.nomix.framework.common.biz.infra.logger.dto.ApiErrorLogCreateReqDTO;
import com.lxzy.nomix.module.infra.service.logger.ApiErrorLogService;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;

/**
 * API 访问日志的 API 接口
 *
 * @author Nomix
 */
@Service
@Validated
public class ApiErrorLogApiImpl implements ApiErrorLogCommonApi {

    @Resource
    private ApiErrorLogService apiErrorLogService;

    @Override
    public void createApiErrorLog(ApiErrorLogCreateReqDTO createDTO) {
        apiErrorLogService.createApiErrorLog(createDTO);
    }

}
