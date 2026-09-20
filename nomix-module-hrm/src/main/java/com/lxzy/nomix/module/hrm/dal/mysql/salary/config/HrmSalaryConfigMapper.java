package com.lxzy.nomix.module.hrm.dal.mysql.salary.config;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.hrm.dal.dataobject.salary.config.HrmSalaryConfigDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HrmSalaryConfigMapper extends BaseMapperX<HrmSalaryConfigDO> {

    default HrmSalaryConfigDO selectFirst() {
        return selectOne(new LambdaQueryWrapperX<HrmSalaryConfigDO>()
                .orderByAsc(HrmSalaryConfigDO::getId)
                .last("LIMIT 1"));
    }

}
