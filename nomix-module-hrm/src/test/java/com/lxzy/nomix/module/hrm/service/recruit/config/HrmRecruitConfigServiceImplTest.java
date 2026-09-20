package com.lxzy.nomix.module.hrm.service.recruit.config;

import com.lxzy.nomix.framework.test.core.ut.BaseDbUnitTest;
import com.lxzy.nomix.module.hrm.controller.admin.recruit.vo.config.HrmRecruitEliminateReasonSaveReqVO;
import com.lxzy.nomix.module.hrm.service.config.HrmConfigService;
import com.lxzy.nomix.module.hrm.enums.config.HrmConfigTypeEnum;
import javax.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.context.annotation.Import;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * {@link HrmRecruitConfigServiceImpl} 的单元测试类
 *
 * @author Nomix
 */
@Import(HrmRecruitConfigServiceImpl.class)
public class HrmRecruitConfigServiceImplTest extends BaseDbUnitTest {

    @Resource
    private HrmRecruitConfigServiceImpl recruitConfigService;
    @MockBean
    private HrmConfigService configService;

    @Test
    public void testSaveRecruitEliminateReason_success() {
        // 准备参数
        HrmRecruitEliminateReasonSaveReqVO saveReqVO = new HrmRecruitEliminateReasonSaveReqVO();
        saveReqVO.setReasons(Arrays.asList("简历不匹配", "薪资不匹配", "简历不匹配", "  面试未通过  "));

        // 调用
        recruitConfigService.saveRecruitEliminateReason(saveReqVO);

        // 断言
        List<String> reasons = Arrays.asList("简历不匹配", "薪资不匹配", "面试未通过");
        verify(configService).replaceConfigValueList(HrmConfigTypeEnum.RECRUIT_ELIMINATE.getType(), reasons);

        // mock 方法
        when(configService.getConfigValueList(HrmConfigTypeEnum.RECRUIT_ELIMINATE.getType())).thenReturn(reasons);

        // 调用，并断言
        assertEquals(reasons, recruitConfigService.getRecruitEliminateReasonList());
    }

}
