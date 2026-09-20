package com.lxzy.nomix.module.mes.dal.mysql.qc.oqc;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.qc.oqc.vo.line.MesQcOqcLinePageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.qc.oqc.MesQcOqcLineDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MES 出货检验单行 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface MesQcOqcLineMapper extends BaseMapperX<MesQcOqcLineDO> {

    default PageResult<MesQcOqcLineDO> selectPage(MesQcOqcLinePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesQcOqcLineDO>()
                .eqIfPresent(MesQcOqcLineDO::getOqcId, reqVO.getOqcId())
                .orderByAsc(MesQcOqcLineDO::getId));
    }

    default List<MesQcOqcLineDO> selectListByOqcId(Long oqcId) {
        return selectList(MesQcOqcLineDO::getOqcId, oqcId);
    }

    default void deleteByOqcId(Long oqcId) {
        delete(new LambdaQueryWrapperX<MesQcOqcLineDO>()
                .eq(MesQcOqcLineDO::getOqcId, oqcId));
    }

    default Long selectCountByUnitMeasureId(Long unitMeasureId) {
        return selectCount(MesQcOqcLineDO::getUnitMeasureId, unitMeasureId);
    }

}
