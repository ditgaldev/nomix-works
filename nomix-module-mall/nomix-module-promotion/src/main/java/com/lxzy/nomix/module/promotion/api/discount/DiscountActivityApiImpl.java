package com.lxzy.nomix.module.promotion.api.discount;

import com.lxzy.nomix.framework.common.util.object.BeanUtils;
import com.lxzy.nomix.module.promotion.api.discount.dto.DiscountProductRespDTO;
import com.lxzy.nomix.module.promotion.dal.dataobject.discount.DiscountProductDO;
import com.lxzy.nomix.module.promotion.service.discount.DiscountActivityService;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

/**
 * 限时折扣 API 实现类
 *
 * @author Nomix
 */
@Service
@Validated
public class DiscountActivityApiImpl implements DiscountActivityApi {

    @Resource
    private DiscountActivityService discountActivityService;

    @Override
    public List<DiscountProductRespDTO> getMatchDiscountProductListBySkuIds(Collection<Long> skuIds) {
        List<DiscountProductDO> list = discountActivityService.getMatchDiscountProductListBySkuIds(skuIds);
        return BeanUtils.toBean(list, DiscountProductRespDTO.class);
    }

}
