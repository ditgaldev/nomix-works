package com.lxzy.nomix.module.mes.dal.mysql.wm.barcode;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.wm.barcode.vo.MesWmBarcodePageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.wm.barcode.MesWmBarcodeDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;

/**
 * MES 条码清单 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface MesWmBarcodeMapper extends BaseMapperX<MesWmBarcodeDO> {

    default PageResult<MesWmBarcodeDO> selectPage(MesWmBarcodePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<MesWmBarcodeDO>()
                .eqIfPresent(MesWmBarcodeDO::getConfigId, reqVO.getConfigId())
                .eqIfPresent(MesWmBarcodeDO::getFormat, reqVO.getFormat())
                .eqIfPresent(MesWmBarcodeDO::getBizType, reqVO.getBizType())
                .likeIfPresent(MesWmBarcodeDO::getContent, reqVO.getContent())
                .eqIfPresent(MesWmBarcodeDO::getBizId, reqVO.getBizId())
                .likeIfPresent(MesWmBarcodeDO::getBizCode, reqVO.getBizCode())
                .likeIfPresent(MesWmBarcodeDO::getBizName, reqVO.getBizName())
                .eqIfPresent(MesWmBarcodeDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(MesWmBarcodeDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(MesWmBarcodeDO::getId));
    }

    default MesWmBarcodeDO selectByBizTypeAndBizId(Integer bizType, Long bizId) {
        return selectOne(new LambdaQueryWrapperX<MesWmBarcodeDO>()
                .eq(MesWmBarcodeDO::getBizType, bizType)
                .eq(MesWmBarcodeDO::getBizId, bizId));
    }

    default MesWmBarcodeDO selectByContent(String content) {
        return selectOne(MesWmBarcodeDO::getContent, content);
    }

    default Long selectCountByConfigId(Long configId) {
        return selectCount(MesWmBarcodeDO::getConfigId, configId);
    }

    default int deleteByBizTypeAndBizIds(Integer bizType, Collection<Long> bizIds) {
        return delete(new LambdaQueryWrapperX<MesWmBarcodeDO>()
                .eq(MesWmBarcodeDO::getBizType, bizType)
                .inIfPresent(MesWmBarcodeDO::getBizId, bizIds));
    }

}
