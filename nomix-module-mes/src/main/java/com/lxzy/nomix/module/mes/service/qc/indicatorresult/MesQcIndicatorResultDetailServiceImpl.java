package com.lxzy.nomix.module.mes.service.qc.indicatorresult;

import com.lxzy.nomix.framework.mybatis.core.query.LambdaQueryWrapperX;
import com.lxzy.nomix.module.mes.dal.dataobject.qc.indicatorresult.MesQcIndicatorResultDetailDO;
import com.lxzy.nomix.module.mes.dal.mysql.qc.indicatorresult.MesQcIndicatorResultDetailMapper;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.util.List;

/**
 * MES 检验结果明细 Service 实现类
 *
 * @author Nomix
 */
@Service
@Validated
public class MesQcIndicatorResultDetailServiceImpl implements MesQcIndicatorResultDetailService {

    @Resource
    private MesQcIndicatorResultDetailMapper detailMapper;

    @Override
    public void createDetailList(List<MesQcIndicatorResultDetailDO> details) {
        detailMapper.insertBatch(details);
    }

    @Override
    public void createOrUpdateDetailList(List<MesQcIndicatorResultDetailDO> details) {
        detailMapper.insertOrUpdate(details);
    }

    @Override
    public List<MesQcIndicatorResultDetailDO> getDetailListByResultId(Long resultId) {
        return detailMapper.selectListByResultId(resultId);
    }

    @Override
    public void deleteDetailByResultId(Long resultId) {
        detailMapper.delete(new LambdaQueryWrapperX<MesQcIndicatorResultDetailDO>()
                .eq(MesQcIndicatorResultDetailDO::getResultId, resultId));
    }

}
