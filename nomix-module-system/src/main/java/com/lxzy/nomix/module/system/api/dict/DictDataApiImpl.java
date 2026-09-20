package com.lxzy.nomix.module.system.api.dict;

import com.lxzy.nomix.framework.common.util.object.BeanUtils;
import com.lxzy.nomix.framework.common.biz.system.dict.dto.DictDataRespDTO;
import com.lxzy.nomix.module.system.dal.dataobject.dict.DictDataDO;
import com.lxzy.nomix.module.system.service.dict.DictDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

/**
 * 字典数据 API 实现类
 *
 * @author Nomix
 */
@Service
public class DictDataApiImpl implements DictDataApi {

    @Resource
    private DictDataService dictDataService;

    @Override
    public void validateDictDataList(String dictType, Collection<String> values) {
        dictDataService.validateDictDataList(dictType, values);
    }

    @Override
    public List<DictDataRespDTO> getDictDataList(String dictType) {
        List<DictDataDO> list = dictDataService.getDictDataListByDictType(dictType);
        return BeanUtils.toBean(list, DictDataRespDTO.class);
    }

}
