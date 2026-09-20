package com.lxzy.nomix.module.mes.dal.mysql.dv.repair;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.dv.repair.vo.MesDvRepairPageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.dv.repair.MesDvRepairDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * MES 维修工单 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface MesDvRepairMapper extends BaseMapperX<MesDvRepairDO> {

    default PageResult<MesDvRepairDO> selectPage(MesDvRepairPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesDvRepairDO>()
                .likeIfPresent(MesDvRepairDO::getCode, reqVO.getCode())
                .likeIfPresent(MesDvRepairDO::getName, reqVO.getName())
                .eqIfPresent(MesDvRepairDO::getMachineryId, reqVO.getMachineryId())
                .eqIfPresent(MesDvRepairDO::getResult, reqVO.getResult())
                .eqIfPresent(MesDvRepairDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(MesDvRepairDO::getRequireDate, reqVO.getRequireDate())
                .orderByDesc(MesDvRepairDO::getId));
    }

    default MesDvRepairDO selectByCode(String code) {
        return selectOne(MesDvRepairDO::getCode, code);
    }

    default Long selectCountByMachineryId(Long machineryId) {
        return selectCount(MesDvRepairDO::getMachineryId, machineryId);
    }

}
