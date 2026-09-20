package com.lxzy.nomix.module.mes.dal.mysql.pro.workrecord;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.pro.workrecord.vo.MesProWorkRecordLogPageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.pro.workrecord.MesProWorkRecordLogDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * MES 上下工记录流水 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface MesProWorkRecordLogMapper extends BaseMapperX<MesProWorkRecordLogDO> {

    default PageResult<MesProWorkRecordLogDO> selectPage(MesProWorkRecordLogPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesProWorkRecordLogDO>()
                .eqIfPresent(MesProWorkRecordLogDO::getUserId, reqVO.getUserId())
                .eqIfPresent(MesProWorkRecordLogDO::getWorkstationId, reqVO.getWorkstationId())
                .eqIfPresent(MesProWorkRecordLogDO::getType, reqVO.getType())
                .betweenIfPresent(MesProWorkRecordLogDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(MesProWorkRecordLogDO::getId));
    }

}
