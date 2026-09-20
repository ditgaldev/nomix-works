package com.lxzy.nomix.module.bpm.framework.flowable.core.candidate.strategy.user;

import com.lxzy.nomix.framework.test.core.ut.BaseMockitoUnitTest;
import com.lxzy.nomix.module.bpm.dal.dataobject.definition.BpmUserGroupDO;
import com.lxzy.nomix.module.bpm.service.definition.BpmUserGroupService;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.util.Arrays;
import java.util.Set;

import static com.lxzy.nomix.framework.common.util.collection.SetUtils.asSet;
import static com.lxzy.nomix.framework.test.core.util.RandomUtils.randomPojo;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

@Disabled // TODO Nomix：临时注释
public class BpmTaskCandidateGroupStrategyTest extends BaseMockitoUnitTest {

    @InjectMocks
    private BpmTaskCandidateGroupStrategy strategy;

    @Mock
    private BpmUserGroupService userGroupService;

    @Test
    public void testCalculateUsers() {
        // 准备参数
        String param = "1,2";
        // mock 方法
        BpmUserGroupDO userGroup1 = randomPojo(BpmUserGroupDO.class, o -> o.setUserIds(asSet(11L, 12L)));
        BpmUserGroupDO userGroup2 = randomPojo(BpmUserGroupDO.class, o -> o.setUserIds(asSet(21L, 22L)));
        when(userGroupService.getUserGroupList(eq(asSet(1L, 2L)))).thenReturn(Arrays.asList(userGroup1, userGroup2));

        // 调用
        Set<Long> userIds = strategy.calculateUsersByTask(null, param);
        // 断言
        assertEquals(asSet(11L, 12L, 21L, 22L), userIds);
    }

}
