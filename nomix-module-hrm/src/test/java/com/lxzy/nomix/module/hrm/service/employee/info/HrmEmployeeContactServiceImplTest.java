package com.lxzy.nomix.module.hrm.service.employee.info;

import com.lxzy.nomix.framework.test.core.ut.BaseDbUnitTest;
import com.lxzy.nomix.module.hrm.controller.admin.employee.vo.contact.HrmEmployeeContactSaveReqVO;
import com.lxzy.nomix.module.hrm.dal.dataobject.employee.info.HrmEmployeeContactDO;
import com.lxzy.nomix.module.hrm.dal.mysql.employee.info.HrmEmployeeContactMapper;
import javax.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.context.annotation.Import;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.List;

import static com.lxzy.nomix.framework.test.core.util.AssertUtils.assertPojoEquals;
import static com.lxzy.nomix.framework.test.core.util.AssertUtils.assertServiceException;
import static com.lxzy.nomix.framework.test.core.util.RandomUtils.randomLongId;
import static com.lxzy.nomix.framework.test.core.util.RandomUtils.randomPojo;
import static com.lxzy.nomix.module.hrm.enums.ErrorCodeConstants.EMPLOYEE_CONTACT_NOT_EXISTS;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.verify;

/**
 * {@link HrmEmployeeContactServiceImpl} 的单元测试类
 *
 * @author Nomix
 */
@Import(HrmEmployeeContactServiceImpl.class)
public class HrmEmployeeContactServiceImplTest extends BaseDbUnitTest {

    @Resource
    private HrmEmployeeContactServiceImpl contactService;

    @Resource
    private HrmEmployeeContactMapper contactMapper;

    @MockBean
    private HrmEmployeeService employeeService;

    @Test
    public void testCreateContact_success() {
        // 准备参数
        Long employeeId = randomLongId();
        HrmEmployeeContactSaveReqVO reqVO = randomPojo(
                HrmEmployeeContactSaveReqVO.class,
                o -> o.setId(null).setEmployeeId(employeeId).setSort(10));

        // 调用
        Long id = contactService.createContact(reqVO);

        // 断言
        assertNotNull(id);
        assertPojoEquals(reqVO, contactMapper.selectById(id), "id");
        verify(employeeService).validateEmployeeExists(employeeId);
    }

    @Test
    public void testUpdateContact_success() {
        // mock 数据
        HrmEmployeeContactDO dbRecord = randomPojo(HrmEmployeeContactDO.class,
                o -> o.setId(null).setEmployeeId(randomLongId()).setSort(20).setDeleted(false));
        contactMapper.insert(dbRecord);
        // 准备参数
        HrmEmployeeContactSaveReqVO reqVO = randomPojo(
                HrmEmployeeContactSaveReqVO.class,
                o -> o.setId(dbRecord.getId()).setEmployeeId(dbRecord.getEmployeeId()).setSort(10));

        // 调用
        contactService.updateContact(reqVO);

        // 断言
        HrmEmployeeContactDO contact = contactMapper.selectById(dbRecord.getId());
        assertPojoEquals(reqVO, contact, "employeeId");
        assertEquals(dbRecord.getEmployeeId(), contact.getEmployeeId());
    }

    @Test
    public void testDeleteContact_success() {
        // mock 数据
        HrmEmployeeContactDO dbRecord = randomPojo(HrmEmployeeContactDO.class,
                o -> o.setId(null).setEmployeeId(randomLongId()).setSort(20).setDeleted(false));
        contactMapper.insert(dbRecord);
        // 准备参数
        Long id = dbRecord.getId();

        // 调用
        contactService.deleteContact(id);

        // 断言
        assertNull(contactMapper.selectById(id));
    }

    @Test
    public void testDeleteContact_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用，并断言异常
        assertServiceException(() -> contactService.deleteContact(id), EMPLOYEE_CONTACT_NOT_EXISTS);
    }

    @Test
    public void testGetContactListByEmployeeId() {
        // mock 数据
        Long employeeId = randomLongId();
        HrmEmployeeContactDO firstRecord = randomPojo(HrmEmployeeContactDO.class,
                o -> o.setId(null).setEmployeeId(employeeId).setSort(20).setDeleted(false));
        contactMapper.insert(firstRecord);
        HrmEmployeeContactDO secondRecord = randomPojo(HrmEmployeeContactDO.class,
                o -> o.setId(null).setEmployeeId(employeeId).setSort(10).setDeleted(false));
        contactMapper.insert(secondRecord);
        contactMapper.insert(randomPojo(HrmEmployeeContactDO.class,
                o -> o.setId(null).setEmployeeId(randomLongId()).setSort(1).setDeleted(false)));

        // 调用
        List<HrmEmployeeContactDO> result = contactService.getContactListByEmployeeId(employeeId);
        // 断言
        assertEquals(2, result.size());
        assertEquals(secondRecord.getId(), result.get(0).getId());
        assertEquals(firstRecord.getId(), result.get(1).getId());
    }

}
