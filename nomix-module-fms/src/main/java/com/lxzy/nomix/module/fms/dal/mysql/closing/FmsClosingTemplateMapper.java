package com.lxzy.nomix.module.fms.dal.mysql.closing;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.fms.dal.dataobject.closing.FmsClosingTemplateDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * FMS 结账模板 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface FmsClosingTemplateMapper extends BaseMapperX<FmsClosingTemplateDO> {

    default FmsClosingTemplateDO selectByIdAndAccountSetId(Long id, Long accountSetId) {
        return selectOne(new LambdaQueryWrapperX<FmsClosingTemplateDO>()
                .eq(FmsClosingTemplateDO::getId, id)
                .eq(FmsClosingTemplateDO::getAccountSetId, accountSetId));
    }

    default List<FmsClosingTemplateDO> selectListByAccountSetId(Long accountSetId) {
        return selectList(new LambdaQueryWrapperX<FmsClosingTemplateDO>()
                .eq(FmsClosingTemplateDO::getAccountSetId, accountSetId)
                .orderByAsc(FmsClosingTemplateDO::getCategory)
                .orderByAsc(FmsClosingTemplateDO::getSort)
                .orderByAsc(FmsClosingTemplateDO::getId));
    }

}
