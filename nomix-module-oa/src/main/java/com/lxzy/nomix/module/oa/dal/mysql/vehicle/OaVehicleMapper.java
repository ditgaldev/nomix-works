package com.lxzy.nomix.module.oa.dal.mysql.vehicle;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.controller.admin.vehicle.vo.OaVehiclePageReqVO;
import com.lxzy.nomix.module.oa.dal.dataobject.vehicle.OaVehicleDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * OA 车辆 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaVehicleMapper extends BaseMapperX<OaVehicleDO> {

    default PageResult<OaVehicleDO> selectPage(OaVehiclePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<OaVehicleDO>()
                .likeIfPresent(OaVehicleDO::getNo, reqVO.getNo())
                .likeIfPresent(OaVehicleDO::getName, reqVO.getName())
                .eqIfPresent(OaVehicleDO::getDeptId, reqVO.getDeptId())
                .eqIfPresent(OaVehicleDO::getCategory, reqVO.getCategory())
                .eqIfPresent(OaVehicleDO::getStatus, reqVO.getStatus())
                .likeIfPresent(OaVehicleDO::getType, reqVO.getType())
                .likeIfPresent(OaVehicleDO::getBrandModel, reqVO.getBrandModel())
                .betweenIfPresent(OaVehicleDO::getCompulsoryInsuranceExpireTime, reqVO.getCompulsoryInsuranceExpireTime())
                .betweenIfPresent(OaVehicleDO::getCommercialInsuranceExpireTime, reqVO.getCommercialInsuranceExpireTime())
                .betweenIfPresent(OaVehicleDO::getInspectionExpireTime, reqVO.getInspectionExpireTime())
                .orderByDesc(OaVehicleDO::getId));
    }

    default OaVehicleDO selectByNo(String no) {
        return selectOne(OaVehicleDO::getNo, no);
    }

}
