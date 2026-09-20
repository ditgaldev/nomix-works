package com.lxzy.nomix.module.oa.dal.mysql.reimbursement;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.controller.admin.reimbursement.vo.OaReimbursementPageReqVO;
import com.lxzy.nomix.module.oa.dal.dataobject.reimbursement.OaReimbursementDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * OA 费用报销 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaReimbursementMapper extends BaseMapperX<OaReimbursementDO> {

    default PageResult<OaReimbursementDO> selectPage(Long userId, OaReimbursementPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<OaReimbursementDO>()
                .eq(OaReimbursementDO::getCreator, userId.toString())
                .likeIfPresent(OaReimbursementDO::getTitle, reqVO.getTitle())
                .eqIfPresent(OaReimbursementDO::getStatus, reqVO.getStatus())
                .orderByDesc(OaReimbursementDO::getCreateTime, OaReimbursementDO::getId));
    }

}
