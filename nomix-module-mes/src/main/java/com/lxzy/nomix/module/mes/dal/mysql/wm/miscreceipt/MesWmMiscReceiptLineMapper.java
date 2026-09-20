package com.lxzy.nomix.module.mes.dal.mysql.wm.miscreceipt;

import com.lxzy.nomix.framework.common.pojo.PageResult;
import com.lxzy.nomix.framework.mybatis.core.mapper.BaseMapperX;
import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.controller.admin.wm.miscreceipt.vo.line.MesWmMiscReceiptLinePageReqVO;
import com.lxzy.nomix.module.mes.dal.dataobject.wm.miscreceipt.MesWmMiscReceiptLineDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MES 杂项入库单行 Mapper
 *
 * @author Nomix
 */
@Mapper
public interface MesWmMiscReceiptLineMapper extends BaseMapperX<MesWmMiscReceiptLineDO> {

    default List<MesWmMiscReceiptLineDO> selectListByReceiptId(Long receiptId) {
        return selectList(new LambdaQueryWrapperX<MesWmMiscReceiptLineDO>()
                .eq(MesWmMiscReceiptLineDO::getReceiptId, receiptId)
                .orderByAsc(MesWmMiscReceiptLineDO::getId));
    }

    default int deleteByReceiptId(Long receiptId) {
        return delete(new LambdaQueryWrapperX<MesWmMiscReceiptLineDO>()
                .eq(MesWmMiscReceiptLineDO::getReceiptId, receiptId));
    }

    default PageResult<MesWmMiscReceiptLineDO> selectPage(MesWmMiscReceiptLinePageReqVO pageReqVO) {
        return selectPage(pageReqVO, new LambdaQueryWrapperX<MesWmMiscReceiptLineDO>()
                .eq(MesWmMiscReceiptLineDO::getReceiptId, pageReqVO.getReceiptId())
                .orderByAsc(MesWmMiscReceiptLineDO::getId));
    }

}
