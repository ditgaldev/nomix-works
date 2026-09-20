package com.lxzy.nomix.module.fms.dal.mysql.config;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.module.fms.dal.dataobject.config.FmsAccountSetDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * FMS 账套 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface FmsAccountSetMapper extends BaseMapperX<FmsAccountSetDO> {

    default FmsAccountSetDO selectByCompanyCode(String companyCode) {
        return selectOne(FmsAccountSetDO::getCompanyCode, companyCode);
    }

    default FmsAccountSetDO selectByIdForUpdate(Long id) {
        return selectOneForUpdate(FmsAccountSetDO::getId, id);
    }

}
