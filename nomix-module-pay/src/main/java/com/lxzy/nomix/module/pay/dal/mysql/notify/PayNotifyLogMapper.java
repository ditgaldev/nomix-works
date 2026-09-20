package com.lxzy.nomix.module.pay.dal.mysql.notify;

import com.lxzy.nomix.module.pay.dal.dataobject.notify.PayNotifyLogDO;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PayNotifyLogMapper extends BaseMapperX<PayNotifyLogDO> {

    default List<PayNotifyLogDO> selectListByTaskId(Long taskId) {
        return selectList(PayNotifyLogDO::getTaskId, taskId);
    }

}
