package com.lxzy.nomix.module.fms.dal.mysql.config;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.module.fms.dal.dataobject.config.FmsFinanceParameterDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * FMS 财务参数 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface FmsFinanceParameterMapper extends BaseMapperX<FmsFinanceParameterDO> {

    default FmsFinanceParameterDO selectByAccountSetId(Long accountSetId) {
        return selectOne(FmsFinanceParameterDO::getAccountSetId, accountSetId);
    }

}
