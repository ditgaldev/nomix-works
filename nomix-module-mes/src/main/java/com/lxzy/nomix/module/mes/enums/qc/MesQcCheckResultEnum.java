package com.lxzy.nomix.module.mes.enums.qc;

import com.lxzy.nomix.framework.common.core.ArrayValuable;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

/**
 * MES 检测结果枚举
 *
 * @author Nomix源码
 */
@Getter
@AllArgsConstructor
public enum MesQcCheckResultEnum implements ArrayValuable<Integer> {

    PASS(1, "检验通过"),
    FAIL(2, "检验不通过");

    public static final Integer[] ARRAYS = Arrays.stream(values()).map(MesQcCheckResultEnum::getType).toArray(Integer[]::new);

    /**
     * 结果值
     */
    private final Integer type;
    /**
     * 结果名
     */
    private final String name;

    @Override
    public Integer[] array() {
        return ARRAYS;
    }

}
