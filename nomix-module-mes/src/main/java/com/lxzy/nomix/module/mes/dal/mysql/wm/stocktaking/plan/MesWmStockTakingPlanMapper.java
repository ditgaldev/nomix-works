package com.lxzy.nomix.module.mes.dal.mysql.wm.stocktaking.plan;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.wm.stocktaking.plan.vo.MesWmStockTakingPlanPageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.wm.stocktaking.plan.MesWmStockTakingPlanDO;
import org.apache.ibatis.annotations.Mapper;


/**
 * MES 盘点方案 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface MesWmStockTakingPlanMapper extends BaseMapperX<MesWmStockTakingPlanDO> {

    default MesWmStockTakingPlanDO selectByCode(String code) {
        return selectOne(MesWmStockTakingPlanDO::getCode, code);
    }

    default PageResult<MesWmStockTakingPlanDO> selectPage(MesWmStockTakingPlanPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesWmStockTakingPlanDO>()
                .likeIfPresent(MesWmStockTakingPlanDO::getCode, reqVO.getCode())
                .likeIfPresent(MesWmStockTakingPlanDO::getName, reqVO.getName())
                .eqIfPresent(MesWmStockTakingPlanDO::getType, reqVO.getType())
                .eqIfPresent(MesWmStockTakingPlanDO::getStatus, reqVO.getStatus())
                .orderByDesc(MesWmStockTakingPlanDO::getId));
    }

}
