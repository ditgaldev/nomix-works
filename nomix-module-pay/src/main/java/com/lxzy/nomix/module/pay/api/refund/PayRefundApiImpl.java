package com.lxzy.nomix.module.pay.api.refund;

import com.lxzy.nomix.framework.common.util.object.BeanUtils;
import com.lxzy.nomix.module.pay.api.refund.dto.PayRefundCreateReqDTO;
import com.lxzy.nomix.module.pay.api.refund.dto.PayRefundRespDTO;
import com.lxzy.nomix.module.pay.dal.dataobject.refund.PayRefundDO;
import com.lxzy.nomix.module.pay.service.refund.PayRefundService;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;

/**
 * 退款单 API 实现类
 *
 * @author Nomix
 */
@Service
@Validated
public class PayRefundApiImpl implements PayRefundApi {

    @Resource
    private PayRefundService payRefundService;

    @Override
    public Long createRefund(PayRefundCreateReqDTO reqDTO) {
        return payRefundService.createRefund(reqDTO);
    }

    @Override
    public PayRefundRespDTO getRefund(Long id) {
        PayRefundDO refund = payRefundService.getRefund(id);
        return BeanUtils.toBean(refund, PayRefundRespDTO.class);
    }

}
