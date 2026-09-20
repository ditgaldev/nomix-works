package com.lxzy.nomix.module.oa.dal.mysql.note;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.oa.dal.dataobject.note.OaNoteCategoryDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * OA 笔记目录 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface OaNoteCategoryMapper extends BaseMapperX<OaNoteCategoryDO> {

    default OaNoteCategoryDO selectByUserIdAndName(Long userId, String name) {
        return selectOne(OaNoteCategoryDO::getUserId, userId, OaNoteCategoryDO::getName, name);
    }

    default List<OaNoteCategoryDO> selectListByUserId(Long userId) {
        return selectList(new LambdaQueryWrapperX<OaNoteCategoryDO>()
                .eq(OaNoteCategoryDO::getUserId, userId)
                .orderByAsc(OaNoteCategoryDO::getSort)
                .orderByAsc(OaNoteCategoryDO::getId));
    }

}
