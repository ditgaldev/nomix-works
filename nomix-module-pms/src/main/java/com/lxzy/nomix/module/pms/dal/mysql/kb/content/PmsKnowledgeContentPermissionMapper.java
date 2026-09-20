package com.lxzy.nomix.module.pms.dal.mysql.kb.content;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.pms.dal.dataobject.kb.content.PmsKnowledgeContentPermissionDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;

@Mapper
public interface PmsKnowledgeContentPermissionMapper extends BaseMapperX<PmsKnowledgeContentPermissionDO> {

    default List<PmsKnowledgeContentPermissionDO> selectListByLibraryIds(Collection<Long> libraryIds) {
        return selectList(new LambdaQueryWrapperX<PmsKnowledgeContentPermissionDO>()
                .in(PmsKnowledgeContentPermissionDO::getLibraryId, libraryIds));
    }

    default List<PmsKnowledgeContentPermissionDO> selectListByLibraryId(Long libraryId) {
        return selectList(PmsKnowledgeContentPermissionDO::getLibraryId, libraryId);
    }

}
