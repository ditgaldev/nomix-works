package com.lxzy.nomix.module.mes.dal.mysql.qc.ipqc;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.qc.ipqc.vo.line.MesQcIpqcLinePageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.qc.ipqc.MesQcIpqcLineDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MES 过程检验单行 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface MesQcIpqcLineMapper extends BaseMapperX<MesQcIpqcLineDO> {

    default PageResult<MesQcIpqcLineDO> selectPage(MesQcIpqcLinePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesQcIpqcLineDO>()
                .eqIfPresent(MesQcIpqcLineDO::getIpqcId, reqVO.getIpqcId())
                .orderByAsc(MesQcIpqcLineDO::getId));
    }

    default List<MesQcIpqcLineDO> selectListByIpqcId(Long ipqcId) {
        return selectList(MesQcIpqcLineDO::getIpqcId, ipqcId);
    }

    default void deleteByIpqcId(Long ipqcId) {
        delete(new LambdaQueryWrapperX<MesQcIpqcLineDO>()
                .eq(MesQcIpqcLineDO::getIpqcId, ipqcId));
    }

    default Long selectCountByUnitMeasureId(Long unitMeasureId) {
        return selectCount(MesQcIpqcLineDO::getUnitMeasureId, unitMeasureId);
    }

}
