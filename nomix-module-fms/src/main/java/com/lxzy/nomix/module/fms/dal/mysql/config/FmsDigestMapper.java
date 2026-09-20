package com.lxzy.nomix.module.fms.dal.mysql.config;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.fms.dal.dataobject.config.FmsDigestDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * FMS 常用摘要 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface FmsDigestMapper extends BaseMapperX<FmsDigestDO> {

    default List<FmsDigestDO> selectListByAccountSetId(Long accountSetId) {
        return selectList(new LambdaQueryWrapperX<FmsDigestDO>()
                .eq(FmsDigestDO::getAccountSetId, accountSetId)
                .orderByDesc(FmsDigestDO::getUpdateTime)
                .orderByDesc(FmsDigestDO::getId));
    }

}
