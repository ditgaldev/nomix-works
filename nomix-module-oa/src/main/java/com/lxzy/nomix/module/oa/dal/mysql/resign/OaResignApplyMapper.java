package com.lxzy.nomix.module.oa.dal.mysql.resign;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.controller.admin.resign.vo.OaResignApplyPageReqVO;
import com.lxzy.nomix.module.oa.dal.dataobject.resign.OaResignApplyDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * OA 离职申请 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaResignApplyMapper extends BaseMapperX<OaResignApplyDO> {

    default PageResult<OaResignApplyDO> selectPage(Long userId, OaResignApplyPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<OaResignApplyDO>()
                .eq(OaResignApplyDO::getCreator, userId.toString())
                .likeIfPresent(OaResignApplyDO::getTitle, reqVO.getTitle())
                .eqIfPresent(OaResignApplyDO::getStatus, reqVO.getStatus())
                .orderByDesc(OaResignApplyDO::getCreateTime, OaResignApplyDO::getId));
    }

}
