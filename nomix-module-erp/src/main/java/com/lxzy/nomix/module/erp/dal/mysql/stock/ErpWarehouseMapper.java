package com.lxzy.nomix.module.erp.dal.mysql.stock;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.module.erp.controller.admin.stock.vo.warehouse.ErpWarehousePageReqVO;
import com.lxzy.nomix.module.erp.dal.dataobject.stock.ErpWarehouseDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ERP 仓库 Mapper
 *
 * @author Nomix源码
 */
@Mapper
public interface ErpWarehouseMapper extends BaseMapperX<ErpWarehouseDO> {

    default PageResult<ErpWarehouseDO> selectPage(ErpWarehousePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<ErpWarehouseDO>()
                .likeIfPresent(ErpWarehouseDO::getName, reqVO.getName())
                .eqIfPresent(ErpWarehouseDO::getStatus, reqVO.getStatus())
                .orderByDesc(ErpWarehouseDO::getId));
    }

    default ErpWarehouseDO selectByDefaultStatus() {
        return selectOne(ErpWarehouseDO::getDefaultStatus, true);
    }

    default List<ErpWarehouseDO> selectListByStatus(Integer status) {
        return selectList(ErpWarehouseDO::getStatus, status);
    }

}