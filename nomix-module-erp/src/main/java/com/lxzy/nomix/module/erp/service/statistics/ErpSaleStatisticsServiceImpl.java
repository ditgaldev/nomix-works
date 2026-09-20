package com.lxzy.nomix.module.erp.service.statistics;

import com.lxzy.nomix.module.erp.dal.mysql.statistics.ErpSaleStatisticsMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * ERP 销售统计 Service 实现类
 *
 * @author Nomix源码
 */
@Service
public class ErpSaleStatisticsServiceImpl implements ErpSaleStatisticsService {

    @Resource
    private ErpSaleStatisticsMapper saleStatisticsMapper;

    @Override
    public BigDecimal getSalePrice(LocalDateTime beginTime, LocalDateTime endTime) {
        return saleStatisticsMapper.getSalePrice(beginTime, endTime);
    }

}
