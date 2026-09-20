package com.lxzy.nomix.module.mes.dal.mysql.qc.rqc;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.qc.rqc.vo.line.MesQcRqcLinePageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.qc.rqc.MesQcRqcLineDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MES 退货检验行 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface MesQcRqcLineMapper extends BaseMapperX<MesQcRqcLineDO> {

    default PageResult<MesQcRqcLineDO> selectPage(MesQcRqcLinePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesQcRqcLineDO>()
                .eqIfPresent(MesQcRqcLineDO::getRqcId, reqVO.getRqcId())
                .orderByAsc(MesQcRqcLineDO::getId));
    }

    default List<MesQcRqcLineDO> selectListByRqcId(Long rqcId) {
        return selectList(MesQcRqcLineDO::getRqcId, rqcId);
    }

    default void deleteByRqcId(Long rqcId) {
        delete(new LambdaQueryWrapperX<MesQcRqcLineDO>()
                .eq(MesQcRqcLineDO::getRqcId, rqcId));
    }

    default Long selectCountByUnitMeasureId(Long unitMeasureId) {
        return selectCount(MesQcRqcLineDO::getUnitMeasureId, unitMeasureId);
    }

}
