package com.lxzy.nomix.module.oa.dal.mysql.regular;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.controller.admin.regular.vo.OaRegularApplyPageReqVO;
import com.lxzy.nomix.module.oa.dal.dataobject.regular.OaRegularApplyDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * OA 转正申请 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaRegularApplyMapper extends BaseMapperX<OaRegularApplyDO> {

    default PageResult<OaRegularApplyDO> selectPage(Long userId, OaRegularApplyPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<OaRegularApplyDO>()
                .eq(OaRegularApplyDO::getCreator, userId.toString())
                .likeIfPresent(OaRegularApplyDO::getTitle, reqVO.getTitle())
                .eqIfPresent(OaRegularApplyDO::getStatus, reqVO.getStatus())
                .orderByDesc(OaRegularApplyDO::getCreateTime, OaRegularApplyDO::getId));
    }

}
