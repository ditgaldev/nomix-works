package com.lxzy.nomix.module.oa.dal.mysql.discussion;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.controller.admin.discussion.vo.discussion.OaDiscussionPageReqVO;
import com.lxzy.nomix.module.oa.dal.dataobject.discussion.OaDiscussionDO;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * OA 讨论 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaDiscussionMapper extends BaseMapperX<OaDiscussionDO> {

    default PageResult<OaDiscussionDO> selectPage(OaDiscussionPageReqVO pageReqVO) {
        return selectPage(pageReqVO, new LambdaQueryWrapperX<OaDiscussionDO>()
                .likeIfPresent(OaDiscussionDO::getTitle, pageReqVO.getTitle())
                .eqIfPresent(OaDiscussionDO::getType, pageReqVO.getType())
                .eqIfPresent(OaDiscussionDO::getUserId, pageReqVO.getUserId())
                .betweenIfPresent(OaDiscussionDO::getCreateTime, pageReqVO.getCreateTime())
                .orderByDesc(OaDiscussionDO::getId));
    }

    default void updateVisitCount(Long id) {
        update(new LambdaUpdateWrapper<OaDiscussionDO>().eq(OaDiscussionDO::getId, id)
                .setIncrBy(OaDiscussionDO::getVisitCount, 1));
    }

}
