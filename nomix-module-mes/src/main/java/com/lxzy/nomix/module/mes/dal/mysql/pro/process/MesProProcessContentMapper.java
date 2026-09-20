package com.lxzy.nomix.module.mes.dal.mysql.pro.process;

import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.dal.dataobject.pro.process.MesProProcessContentDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MES 生产工序内容 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface MesProProcessContentMapper extends BaseMapperX<MesProProcessContentDO> {

    default List<MesProProcessContentDO> selectListByProcessId(Long processId) {
        return selectList(new LambdaQueryWrapperX<MesProProcessContentDO>()
                .eq(MesProProcessContentDO::getProcessId, processId)
                .orderByAsc(MesProProcessContentDO::getSort));
    }

    default void deleteByProcessId(Long processId) {
        delete(new LambdaQueryWrapperX<MesProProcessContentDO>()
                .eq(MesProProcessContentDO::getProcessId, processId));
    }

}
