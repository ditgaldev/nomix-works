-- Local development schema, generated from this checkout. Existing tables are not altered.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: sql/mysql/quartz.sql
CREATE TABLE IF NOT EXISTS `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME` ASC, `CALENDAR_NAME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-bpm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `bpm_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `code` varchar(63) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `sort` int NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-bpm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `bpm_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `status` tinyint NOT NULL,
  `fields` varchar(255) NOT NULL,
  `conf` varchar(255) NOT NULL,
  `remark` varchar(255),
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-bpm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `bpm_user_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `user_ids` varchar(255) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_account_set` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_code` varchar(64) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_profile` varchar(500) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `legal_representative` varchar(255) DEFAULT NULL,
  `legal_representative_id_number` varchar(255) DEFAULT NULL,
  `business_license_number` varchar(255) DEFAULT NULL,
  `organization_code` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `office_telephone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `fax_number` varchar(32) DEFAULT NULL,
  `qq_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `other_contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `currency_id` bigint DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `standard` int DEFAULT NULL,
  `initialized` bit NOT NULL DEFAULT FALSE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`company_code`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_account_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_set_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `default_status` bit NOT NULL DEFAULT FALSE,
  `founder` bit NOT NULL DEFAULT FALSE,
  `level` int NOT NULL DEFAULT 2,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_assist_combination` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `items` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_auxiliary_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `auxiliary_type_id` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`account_set_id`, `auxiliary_type_id`, `code`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_auxiliary_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `system_preset` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`account_set_id`, `name`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_balance_sheet_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `sort` int DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `row_id` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_balance_sheet_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_period` int DEFAULT NULL,
  `to_period` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `sort` int DEFAULT NULL,
  `opening_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `closing_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `account_set_id` bigint DEFAULT NULL,
  `settled` bit NOT NULL DEFAULT FALSE,
  `row_id` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_cash_flow_extend_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `current_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `editable` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_cash_flow_extend_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `current_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `from_period` int DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `to_period` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_cash_flow_statement_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `sort` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_cash_flow_statement_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_period` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `current_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `sort` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `to_period` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_closing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `period_end` bit NOT NULL DEFAULT FALSE,
  `subject_id` bigint DEFAULT NULL,
  `formula_rule` int DEFAULT NULL,
  `time_type` int DEFAULT NULL,
  `voucher_word_id` bigint DEFAULT NULL,
  `digest` varchar(500) DEFAULT NULL,
  `voucher_type` int DEFAULT NULL,
  `prior_year_adjustment_subject_id` bigint DEFAULT NULL,
  `adjustment_closing_subject_id` bigint DEFAULT NULL,
  `other_closing_subject_id` bigint DEFAULT NULL,
  `reverse_balance` bit NOT NULL DEFAULT FALSE,
  `type` int DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `closing_day` int DEFAULT NULL,
  `subject_rules` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_closing_period` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `closing_time` timestamp DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_closing_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_set_id` bigint DEFAULT NULL,
  `preset_code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `period_end` bit NOT NULL DEFAULT FALSE,
  `subject_id` bigint DEFAULT NULL,
  `formula_rule` int DEFAULT NULL,
  `time_type` int DEFAULT NULL,
  `subject_rules` LONGTEXT DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  `unique_active` int GENERATED ALWAYS AS (CASE WHEN `deleted` = FALSE THEN 1 ELSE NULL END),
  UNIQUE KEY `uk_fms_closing_template_active` (`account_set_id`, `preset_code`, `unique_active`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_closing_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `closing_id` bigint DEFAULT NULL,
  `voucher_id` bigint DEFAULT NULL,
  `voucher_time` timestamp DEFAULT NULL,
  `amount` decimal(24, 6) NOT NULL DEFAULT 0,
  `closed` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_currency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(18,6) NOT NULL DEFAULT 0,
  `standard` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`account_set_id`, `code`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_digest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `account_set_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_finance_indicator` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_set_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(64) NOT NULL,
  `type` int NOT NULL,
  `formula` varchar(2000) NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `status` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_finance_parameter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_set_id` bigint NOT NULL,
  `level` int NOT NULL,
  `subject_code_rule` varchar(64) NOT NULL,
  `ledger_balance_mode` int NOT NULL,
  `deficit_check` bit NOT NULL DEFAULT FALSE,
  `voucher_review_required` bit NOT NULL DEFAULT FALSE,
  `asset_period_locked` bit NOT NULL DEFAULT FALSE,
  `taxpayer_name` varchar(255) DEFAULT NULL,
  `taxpayer_number` varchar(64) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`account_set_id`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_income_statement_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `sort` int DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_income_statement_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `from_period` int DEFAULT NULL,
  `to_period` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `sort` int DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `current_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `account_set_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `settled` bit NOT NULL DEFAULT FALSE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_initial_balance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `auxiliary_accounting` bit NOT NULL DEFAULT FALSE,
  `opening_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `opening_quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `year_debit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_debit_quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `year_credit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_credit_quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `year_opening_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `year_opening_quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `profit_loss_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `profit_loss_quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `account_set_id` bigint DEFAULT NULL,
  `assist_balances` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`account_set_id`, `subject_id`, `deleted`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_report_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `row_no` int DEFAULT NULL,
  `formula` text,
  `remark` varchar(500) DEFAULT NULL,
  `editable` bit NOT NULL DEFAULT FALSE,
  `sort` int DEFAULT NULL,
  `row_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `type` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `balance_direction` int DEFAULT NULL,
  `quantity_unit` varchar(255) DEFAULT NULL,
  `cash` bit NOT NULL DEFAULT FALSE,
  `status` tinyint NOT NULL DEFAULT 0,
  `level` int DEFAULT NULL,
  `quantity_accounting` bit NOT NULL DEFAULT FALSE,
  `account_set_id` bigint DEFAULT NULL,
  `auxiliary_type_ids` LONGTEXT DEFAULT NULL,
  `currency_ids` varchar(4000) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_subject_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `type` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `balance_direction` int DEFAULT NULL,
  `quantity_unit` varchar(255) DEFAULT NULL,
  `cash` bit NOT NULL DEFAULT FALSE,
  `status` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `quantity_accounting` bit NOT NULL DEFAULT FALSE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `voucher_word_id` bigint DEFAULT NULL,
  `voucher_number` int DEFAULT NULL,
  `voucher_time` timestamp DEFAULT NULL,
  `voucher_period` int GENERATED ALWAYS AS (YEAR(`voucher_time`) * 100 + MONTH(`voucher_time`)),
  `attachment_urls` LONGTEXT DEFAULT NULL,
  `attachment_count` int NOT NULL DEFAULT 0,
  `debit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `credit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` int DEFAULT NULL,
  `reviewer_user_id` bigint DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_voucher_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `digest` varchar(500) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL DEFAULT 0,
  `debit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `credit_amount` decimal(18,2) NOT NULL DEFAULT 0,
  `voucher_id` bigint DEFAULT NULL,
  `subject_code` varchar(64) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `account_set_id` bigint DEFAULT NULL,
  `unit_price` decimal(18,6) NOT NULL DEFAULT 0,
  `assist_combination_id` bigint DEFAULT NULL,
  `auxiliaries` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_voucher_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  `entries` text NOT NULL,
  `account_set_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_voucher_template_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `account_set_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-fms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `fms_voucher_word` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `print_title` varchar(255) DEFAULT NULL,
  `default_status` bit NOT NULL DEFAULT FALSE,
  `sort` int NOT NULL DEFAULT 0,
  `account_set_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_attendance_clock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint DEFAULT NULL,
  `clock_time` timestamp NOT NULL,
  `type` tinyint NOT NULL,
  `attendance_time` timestamp NOT NULL,
  `source_type` tinyint DEFAULT 2,
  `status` tinyint DEFAULT 0,
  `stage` int DEFAULT 1,
  `address` varchar(255) DEFAULT NULL,
  `longitude` decimal(10, 6) DEFAULT NULL,
  `latitude` decimal(10, 6) DEFAULT NULL,
  `ssid` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_attendance_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dept_ids` varchar(4000) DEFAULT NULL,
  `employee_ids` varchar(4000) DEFAULT NULL,
  `open_wifi_card` boolean NOT NULL DEFAULT FALSE,
  `open_point_card` boolean NOT NULL DEFAULT FALSE,
  `shifts` LONGTEXT NOT NULL,
  `rest` boolean NOT NULL DEFAULT TRUE,
  `special_dates` varchar(4000) NOT NULL,
  `points` LONGTEXT NOT NULL,
  `wifis` LONGTEXT NOT NULL,
  `deduct_rule` varchar(4000) NOT NULL,
  `default_status` boolean NOT NULL DEFAULT FALSE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_attendance_holiday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `type` tinyint DEFAULT 2,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_attendance_leave` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `day` decimal(10, 2) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `approval_status` tinyint NOT NULL,
  `process_instance_id` varchar(64) DEFAULT NULL,
  `approval_time` timestamp DEFAULT NULL,
  `approval_reason` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_hrm_attendance_leave_process_instance_id` UNIQUE (`process_instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL,
  `value` varchar(255) NOT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `job_number` varchar(64) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `nation` varchar(64) DEFAULT NULL,
  `id_type` tinyint DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `native_place` varchar(128) DEFAULT NULL,
  `birthday` timestamp DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `highest_education` tinyint DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL,
  `leader_employee_id` bigint DEFAULT NULL,
  `entry_status` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `entry_time` timestamp DEFAULT NULL,
  `probation` int DEFAULT NULL,
  `regular_time` timestamp DEFAULT NULL,
  `leave_time` timestamp DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `post_level` varchar(255) DEFAULT NULL,
  `work_city` varchar(64) DEFAULT NULL,
  `work_address` varchar(255) DEFAULT NULL,
  `work_detail_address` varchar(255) DEFAULT NULL,
  `channel_id` bigint DEFAULT NULL,
  `company_age_start_time` timestamp DEFAULT NULL,
  `company_age` int DEFAULT NULL,
  `candidate_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_certificate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `issuing_authority` varchar(255) DEFAULT NULL,
  `issuing_time` timestamp DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_change_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `type` tinyint DEFAULT NULL,
  `reason` tinyint DEFAULT NULL,
  `old_dept_id` bigint DEFAULT NULL,
  `new_dept_id` bigint DEFAULT NULL,
  `old_post_name` varchar(255) DEFAULT NULL,
  `new_post_name` varchar(255) DEFAULT NULL,
  `old_post_level` varchar(255) DEFAULT NULL,
  `new_post_level` varchar(255) DEFAULT NULL,
  `old_work_address` varchar(255) DEFAULT NULL,
  `new_work_address` varchar(255) DEFAULT NULL,
  `old_leader_employee_id` bigint DEFAULT NULL,
  `new_leader_employee_id` bigint DEFAULT NULL,
  `probation` int DEFAULT NULL,
  `effect_time` timestamp DEFAULT NULL,
  `applied_time` timestamp DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `relation` varchar(64) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `work_unit` varchar(128) DEFAULT NULL,
  `post_name` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `no` varchar(128) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `term` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `sign_company` varchar(255) DEFAULT NULL,
  `sign_time` timestamp DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `expire_remind` boolean DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `file_urls` varchar(2048) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_education_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `education` tinyint DEFAULT NULL,
  `graduate_school` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `admission_time` timestamp DEFAULT NULL,
  `graduation_time` timestamp DEFAULT NULL,
  `teaching_methods` tinyint DEFAULT NULL,
  `first_degree` boolean DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `type` tinyint NOT NULL,
  `url` varchar(512) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_personal_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `content` varchar(1024) NOT NULL,
  `reminder_time` timestamp NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_quit_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `plan_quit_time` timestamp DEFAULT NULL,
  `apply_quit_time` timestamp DEFAULT NULL,
  `salary_settlement_time` timestamp DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `reason` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `old_employee_status` tinyint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_salary_card` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `bank_card_number` varchar(64) DEFAULT NULL,
  `bank_area_id` int DEFAULT NULL,
  `bank_name` varchar(64) DEFAULT NULL,
  `bank_branch_name` varchar(128) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_training_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `course` varchar(128) DEFAULT NULL,
  `organization_name` varchar(128) DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `duration` varchar(64) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `certificate_name` varchar(128) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_employee_work_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `work_unit` varchar(255) DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `witness_name` varchar(255) DEFAULT NULL,
  `witness_phone` varchar(32) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_insurance_employee_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `first_social_security` boolean NOT NULL DEFAULT FALSE,
  `first_accumulation_fund` boolean NOT NULL DEFAULT FALSE,
  `social_security_number` varchar(64) DEFAULT NULL,
  `accumulation_fund_number` varchar(64) DEFAULT NULL,
  `social_security_start_month` timestamp DEFAULT NULL,
  `scheme_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_insurance_month_employee_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `month_record_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  `scheme_id` bigint DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `personal_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `personal_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `projects` LONGTEXT NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_insurance_month_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `insured_employee_count` int DEFAULT NULL,
  `stopped_employee_count` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `personal_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `personal_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_insurance_scheme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `area_id` int DEFAULT NULL,
  `household_type` varchar(64) DEFAULT NULL,
  `type` tinyint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_insurance_scheme_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scheme_id` bigint NOT NULL,
  `type` tinyint NOT NULL,
  `name` varchar(64) NOT NULL,
  `base_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_rate` decimal(10, 2) DEFAULT NULL,
  `personal_rate` decimal(10, 2) DEFAULT NULL,
  `corporate_amount` decimal(12, 2) DEFAULT NULL,
  `personal_amount` decimal(12, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  `status` tinyint DEFAULT 2,
  `process_status` tinyint DEFAULT 1,
  `stage_type` tinyint DEFAULT 0,
  `stage_sort` int DEFAULT 0,
  `score` decimal(10, 2) DEFAULT 0.00,
  `result_level` varchar(64) DEFAULT NULL,
  `coefficient` decimal(10, 2) DEFAULT 1.00,
  `target_confirmation_result` tinyint DEFAULT NULL,
  `target_confirmation_comment` varchar(1000) DEFAULT NULL,
  `target_confirmation_time` timestamp DEFAULT NULL,
  `self_comment` varchar(2000) DEFAULT NULL,
  `reviewer_comment` varchar(2000) DEFAULT NULL,
  `result_comment` varchar(2000) DEFAULT NULL,
  `result_confirmation_time` timestamp DEFAULT NULL,
  `result_audit_status` tinyint DEFAULT NULL,
  `result_audit_time` timestamp DEFAULT NULL,
  `result_audit_reason` varchar(1000) DEFAULT NULL,
  `appeal_reason` varchar(1000) DEFAULT NULL,
  `appeal_file_urls` varchar(2000) DEFAULT NULL,
  `appeal_submit_time` timestamp DEFAULT NULL,
  `appeal_status` tinyint DEFAULT 0,
  `appeal_time` timestamp DEFAULT NULL,
  `appeal_comment` varchar(1000) DEFAULT NULL,
  `archive_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_action_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `type` tinyint NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `file_urls` varchar(2000) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_appeal_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_dimension` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `quota_type` tinyint DEFAULT NULL,
  `weight` decimal(10, 2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `allow_edit` bit NOT NULL DEFAULT FALSE,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_quota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint NOT NULL,
  `dimension_id` bigint NOT NULL,
  `preset` bit NOT NULL DEFAULT TRUE,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `standard` varchar(1000) DEFAULT NULL,
  `weight` decimal(10, 2) DEFAULT 100.00,
  `score_type` tinyint DEFAULT NULL,
  `target_value` varchar(1000) DEFAULT NULL,
  `actual_value` varchar(1000) DEFAULT NULL,
  `self_score` decimal(10, 2) DEFAULT 0.00,
  `reviewer_score` decimal(10, 2) DEFAULT 0.00,
  `final_score` decimal(10, 2) DEFAULT 0.00,
  `sort` int DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_quota_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_stage_id` bigint NOT NULL,
  `assessment_quota_id` bigint NOT NULL,
  `score` decimal(10, 2) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_stage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_id` bigint NOT NULL,
  `type` tinyint NOT NULL,
  `name` varchar(128) NOT NULL,
  `handler_employee_id` bigint DEFAULT NULL,
  `rater_type` tinyint DEFAULT NULL,
  `weight` decimal(10, 2) DEFAULT NULL,
  `scoring_type` tinyint DEFAULT NULL,
  `visible_content` tinyint DEFAULT NULL,
  `required_setting` bit DEFAULT NULL,
  `reject_authority` bit DEFAULT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 0,
  `score` decimal(10, 2) DEFAULT NULL,
  `result_level` varchar(64) DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `reject_reason` varchar(1000) DEFAULT NULL,
  `submit_time` timestamp DEFAULT NULL,
  `deadline_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_assessment_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `illustrate` varchar(1000) DEFAULT NULL,
  `score_calculation` tinyint DEFAULT 1,
  `upper_limit_type` tinyint DEFAULT 0,
  `upper_limit_score` decimal(10, 2) DEFAULT 100.00,
  `dimension_count` int DEFAULT 0,
  `quota_count` int DEFAULT 0,
  `dimensions` LONGTEXT NOT NULL,
  `status` tinyint DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cycle_type` tinyint DEFAULT NULL,
  `cycle` varchar(255) DEFAULT NULL,
  `quarter` tinyint DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `scopes` LONGTEXT NOT NULL,
  `assessment_template_id` bigint NOT NULL,
  `assessment_config` LONGTEXT NOT NULL,
  `result_template_id` bigint NOT NULL,
  `result_config` LONGTEXT NOT NULL,
  `quota_setting_type` tinyint NOT NULL DEFAULT 1,
  `target_confirmation` bit DEFAULT FALSE NOT NULL,
  `target_confirmation_stage` LONGTEXT DEFAULT NULL,
  `review_stages` LONGTEXT NOT NULL,
  `result_audit` bit DEFAULT TRUE NOT NULL,
  `result_audit_stages` LONGTEXT DEFAULT NULL,
  `result_confirmation` bit DEFAULT TRUE NOT NULL,
  `appeal_stages` LONGTEXT DEFAULT NULL,
  `appeal_timeout_days` int DEFAULT 2 NOT NULL,
  `appeal_timeout_action` tinyint DEFAULT 1 NOT NULL,
  `sync_to_salary` bit DEFAULT FALSE,
  `paid_for_month` varchar(20) DEFAULT NULL,
  `stage_type` tinyint DEFAULT 0,
  `status` tinyint DEFAULT 2,
  `operation_type` tinyint DEFAULT NULL,
  `terminate_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_performance_result_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `levels` LONGTEXT NOT NULL,
  `status` tinyint DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_recruit_candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `sex` tinyint NOT NULL,
  `age` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `post_id` bigint NOT NULL,
  `stage_number` int DEFAULT NULL,
  `work_time` int DEFAULT NULL,
  `education` tinyint NOT NULL,
  `graduate_school` varchar(255) DEFAULT NULL,
  `latest_work_place` varchar(255) DEFAULT NULL,
  `channel_id` bigint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `eliminate` varchar(255) DEFAULT NULL,
  `status_update_time` timestamp DEFAULT NULL,
  `entry_time` timestamp DEFAULT NULL,
  `resume_urls` varchar(4000) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_recruit_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `system_flag` bit DEFAULT FALSE,
  `status` tinyint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_recruit_interview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint NOT NULL,
  `type` tinyint DEFAULT NULL,
  `stage_number` int DEFAULT NULL,
  `interview_employee_id` bigint DEFAULT NULL,
  `other_interview_employee_ids` varchar(255) DEFAULT NULL,
  `interview_time` timestamp DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `result` tinyint DEFAULT NULL,
  `evaluate` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_recruit_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) NOT NULL,
  `dept_id` bigint DEFAULT NULL,
  `job_nature` tinyint DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `recruit_num` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `work_time` tinyint DEFAULT NULL,
  `education_require` tinyint DEFAULT NULL,
  `min_salary` decimal(10, 2) DEFAULT NULL,
  `max_salary` decimal(10, 2) DEFAULT NULL,
  `salary_unit` tinyint DEFAULT NULL,
  `min_age` int DEFAULT NULL,
  `max_age` int DEFAULT NULL,
  `latest_entry_time` timestamp DEFAULT NULL,
  `owner_employee_id` bigint DEFAULT NULL,
  `interview_employee_ids` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `emergency_level` tinyint DEFAULT NULL,
  `post_type_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `stop_reason` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_recruit_post_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_change_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `type` tinyint DEFAULT NULL,
  `reason` tinyint DEFAULT NULL,
  `effect_time` timestamp DEFAULT NULL,
  `before_total` decimal(12, 2) DEFAULT NULL,
  `after_total` decimal(12, 2) DEFAULT NULL,
  `probation_before_total` decimal(12, 2) DEFAULT NULL,
  `probation_after_total` decimal(12, 2) DEFAULT NULL,
  `salary_options` varchar(4000) DEFAULT NULL,
  `probation_salary_options` varchar(4000) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_change_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `default_status` boolean NOT NULL DEFAULT FALSE,
  `options` varchar(4000) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cycle_start_day` int DEFAULT NULL,
  `cycle_end_day` int DEFAULT NULL,
  `social_security_month_type` tinyint DEFAULT NULL,
  `start_year` int DEFAULT NULL,
  `start_month` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_hrm_salary_config_tenant_id` UNIQUE (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_employee_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `change_reason` tinyint DEFAULT NULL,
  `effect_time` timestamp DEFAULT NULL,
  `change_type` tinyint DEFAULT NULL,
  `probation_salary` decimal(12, 2) DEFAULT NULL,
  `regular_salary` decimal(12, 2) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `salary_options` LONGTEXT DEFAULT NULL,
  `probation_salary_options` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_hrm_salary_employee_info_employee_id` UNIQUE (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `salary_standard` decimal(12, 2) DEFAULT NULL,
  `change_rule` varchar(255) DEFAULT NULL,
  `dept_ids` LONGTEXT DEFAULT NULL,
  `employee_ids` LONGTEXT DEFAULT NULL,
  `tax_rule_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_month_employee_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `month_record_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  `actual_work_day` decimal(10, 2) DEFAULT NULL,
  `need_work_day` decimal(10, 2) DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `expected_pay_salary` decimal(12, 2) DEFAULT NULL,
  `taxable_salary` decimal(12, 2) DEFAULT NULL,
  `personal_tax` decimal(12, 2) DEFAULT NULL,
  `real_pay_salary` decimal(12, 2) DEFAULT NULL,
  `option_values` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_month_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `employee_count` int DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `expected_pay_salary` decimal(12, 2) DEFAULT NULL,
  `personal_tax` decimal(12, 2) DEFAULT NULL,
  `real_pay_salary` decimal(12, 2) DEFAULT NULL,
  `personal_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `personal_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_insurance_amount` decimal(12, 2) DEFAULT NULL,
  `corporate_provident_fund_amount` decimal(12, 2) DEFAULT NULL,
  `option_headers` LONGTEXT DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_option` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `parent_code` int NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `system_flag` boolean NOT NULL DEFAULT FALSE,
  `template_id` bigint DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT 1,
  `tax_enabled` boolean NOT NULL DEFAULT TRUE,
  `visible` boolean NOT NULL DEFAULT TRUE,
  `calculate_enabled` boolean NOT NULL DEFAULT TRUE,
  `enabled` boolean NOT NULL DEFAULT TRUE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_hrm_salary_option_tenant_code` UNIQUE (`tenant_id`, `code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_option_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `parent_code` int NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `system_flag` boolean NOT NULL DEFAULT FALSE,
  `type` tinyint NOT NULL DEFAULT 1,
  `tax_enabled` boolean NOT NULL DEFAULT TRUE,
  `visible` boolean NOT NULL DEFAULT TRUE,
  `calculate_enabled` boolean NOT NULL DEFAULT TRUE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_hrm_salary_option_template_code` UNIQUE (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_slip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `send_record_id` bigint NOT NULL,
  `month_employee_record_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `read_status` tinyint DEFAULT NULL,
  `real_pay_salary` decimal(12, 2) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `options` LONGTEXT NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_slip_send_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `month_record_id` bigint NOT NULL,
  `employee_count` int DEFAULT NULL,
  `send_employee_count` int DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_slip_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `hide_empty` boolean NOT NULL DEFAULT FALSE,
  `default_status` boolean NOT NULL DEFAULT FALSE,
  `options` LONGTEXT NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-hrm/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `hrm_salary_tax_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` tinyint DEFAULT NULL,
  `tax_enabled` bit DEFAULT NULL,
  `threshold` decimal(12, 2) DEFAULT NULL,
  `decimal_scale` int DEFAULT NULL,
  `cycle_type` tinyint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(64) NOT NULL COMMENT '频道业务码；唯一',
  `name` varchar(64) NOT NULL COMMENT '频道名称',
  `avatar` varchar(512) DEFAULT NULL COMMENT '频道头像',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态；0 启用 1 停用',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_channel_material` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint NOT NULL COMMENT '频道编号',
  `type` tinyint NOT NULL COMMENT '内容类型；1 站内富文本 2 外链',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `cover_url` varchar(512) DEFAULT NULL COMMENT '封面图',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` LONGTEXT DEFAULT NULL COMMENT '正文；富文本 HTML',
  `url` varchar(512) DEFAULT NULL COMMENT '跳转链接；为空时点击在客户端内置详情页拉 content；非空则跳 url',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_channel_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint NOT NULL COMMENT '频道编号；冗余 im_channel_material.channel_id 便于检索',
  `material_id` bigint NOT NULL COMMENT '关联素材编号',
  `type` smallint NOT NULL COMMENT '消息类型',
  `content` LONGTEXT DEFAULT NULL COMMENT '消息内容；推送时 payload JSON 快照；不含富文本正文',
  `receiver_user_ids` text DEFAULT NULL COMMENT '接收人编号列表；逗号分隔；为空表示全员',
  `send_time` timestamp NOT NULL COMMENT '发送时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_conversation_read` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `conversation_type` tinyint NOT NULL COMMENT '会话类型',
  `target_id` bigint NOT NULL COMMENT '目标编号',
  `message_id` bigint NOT NULL COMMENT '最大已读消息编号',
  `read_time` timestamp NOT NULL COMMENT '最近已读时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_conversation_read_user_target` UNIQUE (`user_id`, `conversation_type`, `target_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_face_pack` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '表情包名称',
  `icon` varchar(512) DEFAULT NULL COMMENT '表情包图标（面板底部 tab 显示）',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_face_pack_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pack_id` bigint NOT NULL COMMENT '所属表情包编号',
  `url` varchar(512) NOT NULL COMMENT '表情图 URL',
  `name` varchar(64) DEFAULT NULL COMMENT '表情名（可选；如「狗头」「捂脸」）',
  `width` int NOT NULL DEFAULT 0 COMMENT '渲染宽度（像素）',
  `height` int NOT NULL DEFAULT 0 COMMENT '渲染高度（像素）',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_face_user_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '所属用户编号',
  `url` varchar(512) NOT NULL COMMENT '表情图 URL',
  `name` varchar(64) DEFAULT NULL COMMENT '表情名（可选）',
  `width` int NOT NULL DEFAULT 0 COMMENT '渲染宽度（像素）',
  `height` int NOT NULL DEFAULT 0 COMMENT '渲染高度（像素）',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_face_user_item_user_url_deleted` UNIQUE (`user_id`, `url`, `deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_friend` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `friend_user_id` bigint NOT NULL COMMENT '好友用户编号',
  `silent` bit DEFAULT FALSE COMMENT '是否免打扰',
  `display_name` varchar(64) NOT NULL DEFAULT '' COMMENT '好友展示备注（仅自己可见）',
  `add_source` tinyint DEFAULT NULL COMMENT '添加来源',
  `pinned` bit DEFAULT FALSE COMMENT '是否置顶联系人',
  `blocked` bit DEFAULT FALSE COMMENT '是否拉黑',
  `status` tinyint NOT NULL COMMENT '好友状态',
  `add_time` timestamp DEFAULT NULL COMMENT '添加好友时间',
  `delete_time` timestamp DEFAULT NULL COMMENT '删除好友时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_user_friend` UNIQUE (`user_id`, `friend_user_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_friend_request` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `from_user_id` bigint NOT NULL COMMENT '发起方用户编号',
  `to_user_id` bigint NOT NULL COMMENT '接收方用户编号',
  `handle_result` tinyint NOT NULL DEFAULT 0 COMMENT '处理结果；0未处理；1同意；2拒绝',
  `apply_content` varchar(255) DEFAULT NULL COMMENT '申请理由',
  `handle_content` varchar(255) DEFAULT NULL COMMENT '处理理由',
  `display_name` varchar(64) DEFAULT NULL COMMENT '发起方对接收方的备注',
  `add_source` tinyint DEFAULT NULL COMMENT '添加来源',
  `handle_time` timestamp DEFAULT NULL COMMENT '处理时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_friend_request` UNIQUE (`from_user_id`, `to_user_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '群名称',
  `owner_user_id` bigint NOT NULL COMMENT '群主用户编号',
  `avatar` varchar(512) DEFAULT NULL COMMENT '群头像',
  `notice` varchar(2048) DEFAULT NULL COMMENT '群公告',
  `banned` bit DEFAULT FALSE COMMENT '是否封禁',
  `banned_reason` varchar(512) DEFAULT NULL COMMENT '封禁原因',
  `banned_time` timestamp DEFAULT NULL COMMENT '封禁时间',
  `status` tinyint NOT NULL COMMENT '群状态',
  `dissolved_time` timestamp DEFAULT NULL COMMENT '解散时间',
  `muted_all` bit DEFAULT FALSE COMMENT '是否全群禁言',
  `join_approval` bit NOT NULL DEFAULT FALSE COMMENT '进群是否需群主 / 管理员审批；false 自由进群，true 需审批',
  `pinned_message_ids` varchar(128) DEFAULT NULL COMMENT '群置顶消息编号列表，逗号分隔',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_group_member` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `group_id` bigint NOT NULL COMMENT '群编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `display_user_name` varchar(64) DEFAULT NULL COMMENT '组内显示名',
  `group_remark` varchar(64) DEFAULT NULL COMMENT '群备注',
  `silent` bit DEFAULT FALSE COMMENT '是否免打扰',
  `status` tinyint NOT NULL COMMENT '成员状态',
  `role` tinyint NOT NULL DEFAULT 3 COMMENT '成员角色：1=群主 2=管理员 3=普通成员',
  `join_time` timestamp DEFAULT NULL COMMENT '入群时间',
  `add_source` tinyint DEFAULT NULL COMMENT '加入来源',
  `inviter_user_id` bigint DEFAULT NULL COMMENT '邀请人用户编号；用户主动申请进群时为 NULL',
  `quit_time` timestamp DEFAULT NULL COMMENT '退群时间',
  `mute_end_time` timestamp DEFAULT NULL COMMENT '禁言到期时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_group_member` UNIQUE (`group_id`, `user_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_group_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_message_id` varchar(64) DEFAULT NULL COMMENT '客户端消息编号',
  `sender_id` bigint NOT NULL COMMENT '发送人编号',
  `group_id` bigint NOT NULL COMMENT '群编号',
  `type` smallint NOT NULL COMMENT '消息类型',
  `content` LONGTEXT DEFAULT NULL COMMENT '消息内容',
  `status` tinyint NOT NULL COMMENT '消息状态',
  `send_time` timestamp NOT NULL COMMENT '发送时间',
  `receiver_user_ids` text DEFAULT NULL COMMENT '定向接收用户编号列表',
  `at_user_ids` varchar(1024) DEFAULT NULL COMMENT '@ 目标用户编号列表',
  `receipt_status` tinyint NOT NULL DEFAULT 0 COMMENT '回执状态',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_group_message_sender_client` UNIQUE (`sender_id`, `client_message_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_group_request` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `group_id` bigint NOT NULL COMMENT '群编号',
  `user_id` bigint NOT NULL COMMENT '申请人 / 被邀请人用户编号',
  `inviter_user_id` bigint DEFAULT NULL COMMENT '邀请人用户编号；NULL=主动申请；非NULL=被邀请待审批',
  `apply_content` varchar(255) DEFAULT NULL COMMENT '申请理由',
  `add_source` tinyint DEFAULT NULL COMMENT '加入来源',
  `handle_result` tinyint NOT NULL DEFAULT 0 COMMENT '处理结果；0未处理；1同意；2拒绝',
  `handle_user_id` bigint DEFAULT NULL COMMENT '处理人用户编号',
  `handle_content` varchar(255) DEFAULT NULL COMMENT '处理理由',
  `handle_time` timestamp DEFAULT NULL COMMENT '处理时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_group_request` UNIQUE (`group_id`, `user_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_private_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_message_id` varchar(64) DEFAULT NULL COMMENT '客户端消息编号',
  `sender_id` bigint NOT NULL COMMENT '发送人编号',
  `receiver_id` bigint NOT NULL COMMENT '接收人编号',
  `type` smallint NOT NULL COMMENT '消息类型',
  `content` LONGTEXT DEFAULT NULL COMMENT '消息内容',
  `status` tinyint NOT NULL COMMENT '消息状态',
  `receipt_status` tinyint NOT NULL DEFAULT 0 COMMENT '回执状态',
  `send_time` timestamp NOT NULL COMMENT '发送时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_private_message_sender_client` UNIQUE (`sender_id`, `client_message_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_rtc_call` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `room` varchar(64) NOT NULL COMMENT '业务通话编号',
  `conversation_type` tinyint NOT NULL COMMENT '会话类型',
  `media_type` tinyint NOT NULL COMMENT '媒体类型',
  `inviter_user_id` bigint NOT NULL COMMENT '发起人用户编号',
  `group_id` bigint DEFAULT NULL COMMENT '群编号',
  `status` tinyint NOT NULL COMMENT '通话状态',
  `end_reason` tinyint DEFAULT NULL COMMENT '结束原因',
  `start_time` timestamp NOT NULL COMMENT '发起时间',
  `accept_time` timestamp DEFAULT NULL COMMENT '接通时间',
  `end_time` timestamp DEFAULT NULL COMMENT '结束时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_rtc_participant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `call_id` bigint NOT NULL COMMENT '通话编号',
  `room` varchar(64) NOT NULL COMMENT '业务通话编号',
  `user_id` bigint NOT NULL COMMENT '参与者用户编号',
  `role` tinyint NOT NULL COMMENT '参与角色',
  `status` tinyint NOT NULL COMMENT '参与状态',
  `invite_time` timestamp NOT NULL COMMENT '被邀请时间',
  `accept_time` timestamp DEFAULT NULL COMMENT '接听时间',
  `leave_time` timestamp DEFAULT NULL COMMENT '离开时间',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_rtc_participant_room_user` UNIQUE (`room`, `user_id`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-im/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `im_sensitive_word` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `word` varchar(128) NOT NULL COMMENT '敏感词',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态；0 启用 1 停用',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_im_sensitive_word` UNIQUE (`word`, `tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_alert_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `rule_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_alert_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alert_config_id` bigint NOT NULL,
  `alert_name` varchar(255) NOT NULL DEFAULT '',
  `product_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `rule_id` bigint DEFAULT NULL,
  `alert_data` text,
  `alert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deal_status` tinyint NOT NULL DEFAULT '0',
  `deal_time` timestamp DEFAULT NULL,
  `deal_user_id` bigint DEFAULT NULL,
  `deal_remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_data_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) DEFAULT '',
  `status` int NOT NULL,
  `source_configs` LONGTEXT NOT NULL,
  `sink_ids` varchar(512) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) NOT NULL DEFAULT '',
  `product_id` bigint NOT NULL,
  `device_key` varchar(100) NOT NULL DEFAULT '',
  `device_secret` varchar(100) NOT NULL DEFAULT '',
  `nickname` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `status_last_update_time` timestamp DEFAULT NULL,
  `last_online_time` timestamp DEFAULT NULL,
  `last_offline_time` timestamp DEFAULT NULL,
  `active_time` timestamp DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `firmware_version` varchar(50) DEFAULT NULL,
  `device_type` tinyint NOT NULL DEFAULT '0',
  `gateway_id` bigint DEFAULT NULL,
  `sub_device_count` int NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_device_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint NOT NULL DEFAULT '1',
  `data` text,
  `ts` bigint NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_ota_firmware` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_id` bigint NOT NULL,
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `file_size` bigint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_ota_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint NOT NULL,
  `firmware_id` bigint NOT NULL,
  `device_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `progress` int NOT NULL DEFAULT '0',
  `error_msg` varchar(500) DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_ota_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `firmware_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `upgrade_type` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_key` varchar(100) NOT NULL DEFAULT '',
  `protocol_type` tinyint NOT NULL DEFAULT '0',
  `category_id` bigint DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `data_format` tinyint NOT NULL DEFAULT '0',
  `device_type` tinyint NOT NULL DEFAULT '0',
  `net_type` tinyint NOT NULL DEFAULT '0',
  `validate_type` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_scene_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `triggers` text,
  `actions` text,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-iot/nomix-module-iot-biz/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `iot_thing_model` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `property` text,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `market_activity` (
  `id`                    bigint(20)  NOT NULL AUTO_INCREMENT,
  `title`                 varchar(50) NOT NULL,
  `activity_type`         tinyint(4)  NOT NULL,
  `status`                tinyint(4)  NOT NULL,
  `start_time`            datetime    NOT NULL,
  `end_time`              datetime    NOT NULL,
  `invalid_time`          datetime,
  `delete_time`           datetime,
  `time_limited_discount` varchar(2000),
  `full_privilege`        varchar(2000),
  `creator`               varchar(64)          DEFAULT '',
  `create_time`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater`               varchar(64)          DEFAULT '',
  `update_time`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted`               bit         NOT NULL DEFAULT FALSE,
  `tenant_id`             bigint(20)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/address/MemberAddressDO.java
CREATE TABLE IF NOT EXISTS `member_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  `detail_address` varchar(250) NOT NULL,
  `default_status` bit NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `member_brokerage_record` (
  `id`            int      NOT NULL AUTO_INCREMENT,
  `user_id`       bigint   NOT NULL,
  `biz_id`        varchar(255)  NOT NULL,
  `biz_type`      varchar(255)  NOT NULL,
  `title`         varchar(255)  NOT NULL,
  `price`         int      NOT NULL,
  `total_price`   int      NOT NULL,
  `description`   varchar(255)  NOT NULL,
  `status`        varchar(255)  NOT NULL,
  `frozen_days`   int      NOT NULL,
  `unfreeze_time` varchar(255),
  `creator`       varchar(255)           DEFAULT '',
  `create_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater`       varchar(255)           DEFAULT '',
  `update_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted`       bit      NOT NULL DEFAULT FALSE,
  `tenant_id`      bigint   not null default '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/config/MemberConfigDO.java
CREATE TABLE IF NOT EXISTS `member_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `point_trade_deduct_enable` bit(1) DEFAULT NULL,
  `point_trade_deduct_unit_price` int DEFAULT NULL,
  `point_trade_deduct_max_price` int DEFAULT NULL,
  `point_trade_give_point` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/level/MemberExperienceRecordDO.java
CREATE TABLE IF NOT EXISTS `member_experience_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `biz_type` int DEFAULT NULL,
  `biz_id` varchar(512) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `description` LONGTEXT DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `total_experience` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/group/MemberGroupDO.java
CREATE TABLE IF NOT EXISTS `member_group` (
  `id`          bigint   NOT NULL AUTO_INCREMENT,
  `name`        varchar(255)  NOT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/level/MemberLevelDO.java
CREATE TABLE IF NOT EXISTS `member_level` (
  `id`             bigint   NOT NULL AUTO_INCREMENT,
  `name`           varchar(255)  NOT NULL,
  `level`          int      NOT NULL,
  `experience`     int      NOT NULL,
  `discount_percent`       int      NOT NULL,
  `icon`           varchar(255)  NOT NULL,
  `background_url` LONGTEXT DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/level/MemberLevelRecordDO.java
CREATE TABLE IF NOT EXISTS `member_level_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
  `level` int DEFAULT NULL,
  `discount_percent` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `user_experience` int DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `description` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/point/MemberPointRecordDO.java
CREATE TABLE IF NOT EXISTS `member_point_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `biz_id` varchar(512) DEFAULT NULL,
  `biz_type` int DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `description` LONGTEXT DEFAULT NULL,
  `point` int DEFAULT NULL,
  `total_point` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/signin/MemberSignInConfigDO.java
CREATE TABLE IF NOT EXISTS `member_sign_in_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/signin/MemberSignInRecordDO.java
CREATE TABLE IF NOT EXISTS `member_sign_in_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `day` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/tag/MemberTagDO.java
CREATE TABLE IF NOT EXISTS `member_tag` (
  `id`          bigint   NOT NULL AUTO_INCREMENT,
  `name`        varchar(255)  NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-member/src/main/java/com/lxzy/nomix/module/member/dal/dataobject/user/MemberUserDO.java
CREATE TABLE IF NOT EXISTS `member_user` (
  `id`          bigint       NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile`      varchar(11)  NOT NULL COMMENT '手机号',
  `email`       varchar(50)  NULL COMMENT '邮箱',
  `password`    varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `status`      tinyint      NOT NULL COMMENT '状态',
  `register_ip` varchar(32)  NOT NULL COMMENT '注册 IP',
  `register_terminal` int DEFAULT NULL,
  `login_ip`    varchar(50)  NULL     DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL,
  `nickname`    varchar(30)  NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar`      varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `name`        varchar(30)  NULL COMMENT '真实名字',
  `sex` int DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `mark` varchar(512) DEFAULT NULL,
  `point` int DEFAULT NULL,
  `tag_ids` LONGTEXT DEFAULT NULL,
  `level_id`    bigint       NULL     DEFAULT NULL COMMENT '等级编号',
  `experience`  bigint       NULL     DEFAULT NULL COMMENT '经验',
  `group_id`    bigint       NULL     DEFAULT NULL COMMENT '用户分组编号',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_cal_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `calendar_type` tinyint DEFAULT NULL,
  `start_date` timestamp DEFAULT NULL,
  `end_date` timestamp DEFAULT NULL,
  `shift_type` tinyint DEFAULT NULL,
  `shift_method` tinyint DEFAULT NULL,
  `shift_count` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_cal_plan_shift` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_cal_plan_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_cal_team_shift` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `shift_id` bigint DEFAULT NULL,
  `day` timestamp DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_md_auto_code_part` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL,
  `sort` int NOT NULL,
  `type` tinyint NOT NULL,
  `length` int NOT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `fix_character` varchar(64) DEFAULT NULL,
  `serial_start_no` int DEFAULT NULL,
  `serial_step` int DEFAULT NULL,
  `cycle_flag` bit DEFAULT FALSE,
  `cycle_method` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_md_auto_code_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL,
  `result` varchar(64) DEFAULT NULL,
  `serial_no` bigint DEFAULT NULL,
  `input_char` varchar(64) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_md_auto_code_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_length` int DEFAULT NULL,
  `padded` bit NOT NULL DEFAULT FALSE,
  `padded_char` varchar(1) DEFAULT NULL,
  `padded_method` tinyint DEFAULT NULL,
  `status` tinyint NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_pro_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `channel` varchar(64) DEFAULT NULL,
  `feedback_time` timestamp DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `expire_date` timestamp DEFAULT NULL,
  `lot_number` varchar(64) DEFAULT NULL,
  `scheduled_quantity` decimal(14,2) DEFAULT NULL,
  `feedback_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT NULL,
  `unqualified_quantity` decimal(14,2) DEFAULT NULL,
  `uncheck_quantity` decimal(14,2) DEFAULT NULL,
  `labor_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `material_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `other_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `feedback_user_id` bigint DEFAULT NULL,
  `approve_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_pro_route_process` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `next_process_id` bigint DEFAULT NULL,
  `link_type` int DEFAULT NULL,
  `prepare_time` int DEFAULT NULL,
  `wait_time` int DEFAULT NULL,
  `color_code` varchar(20) DEFAULT NULL,
  `key_flag` bit DEFAULT FALSE,
  `check_flag` bit DEFAULT FALSE,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_pro_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `route_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `produced_quantity` decimal(14,2) DEFAULT NULL,
  `qualify_quantity` decimal(14,2) DEFAULT NULL,
  `unqualify_quantity` decimal(14,2) DEFAULT NULL,
  `changed_quantity` decimal(14,2) DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `color_code` varchar(20) DEFAULT NULL,
  `finish_date` timestamp DEFAULT NULL,
  `cancel_date` timestamp DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_qc_indicator_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `qc_id` bigint DEFAULT NULL,
  `qc_type` int DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `sn` varchar(128) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_qc_ipqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `template_id` bigint DEFAULT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT NULL,
  `unqualified_quantity` decimal(14,2) DEFAULT NULL,
  `labor_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `material_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `other_scrap_quantity` decimal(14,2) DEFAULT NULL,
  `critical_rate` decimal(14,2) DEFAULT NULL,
  `major_rate` decimal(14,2) DEFAULT NULL,
  `minor_rate` decimal(14,2) DEFAULT NULL,
  `critical_quantity` int DEFAULT NULL,
  `major_quantity` int DEFAULT NULL,
  `minor_quantity` int DEFAULT NULL,
  `check_result` tinyint DEFAULT NULL,
  `inspect_date` timestamp DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_qc_iqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template_id` bigint DEFAULT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `vendor_batch` varchar(64) DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `received_quantity` decimal(24,6) DEFAULT NULL,
  `check_quantity` decimal(24,6) DEFAULT NULL,
  `qualified_quantity` decimal(24,6) DEFAULT NULL,
  `unqualified_quantity` decimal(24,6) DEFAULT NULL,
  `critical_rate` decimal(10,2) DEFAULT NULL,
  `major_rate` decimal(10,2) DEFAULT NULL,
  `minor_rate` decimal(10,2) DEFAULT NULL,
  `critical_quantity` int DEFAULT NULL,
  `major_quantity` int DEFAULT NULL,
  `minor_quantity` int DEFAULT NULL,
  `check_result` tinyint DEFAULT NULL,
  `receive_date` timestamp DEFAULT NULL,
  `inspect_date` timestamp DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_qc_oqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(500) NOT NULL,
  `template_id` bigint NOT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) DEFAULT NULL,
  `client_id` bigint NOT NULL,
  `batch_code` varchar(64) DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `min_check_quantity` int DEFAULT 1,
  `max_unqualified_quantity` int DEFAULT 0,
  `out_quantity` decimal(14,2) NOT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT 0.00,
  `unqualified_quantity` decimal(14,2) DEFAULT 0.00,
  `critical_rate` decimal(14,2) DEFAULT 0.00,
  `major_rate` decimal(14,2) DEFAULT 0.00,
  `minor_rate` decimal(14,2) DEFAULT 0.00,
  `critical_quantity` int DEFAULT 0,
  `major_quantity` int DEFAULT 0,
  `minor_quantity` int DEFAULT 0,
  `check_result` tinyint DEFAULT NULL,
  `out_date` timestamp DEFAULT NULL,
  `inspect_date` timestamp DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `remark` varchar(500) DEFAULT '',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_qc_rqc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(500) NOT NULL,
  `template_id` bigint NOT NULL,
  `source_doc_type` int DEFAULT NULL,
  `source_doc_id` bigint DEFAULT NULL,
  `source_line_id` bigint DEFAULT NULL,
  `source_doc_code` varchar(64) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `batch_code` varchar(128) DEFAULT NULL,
  `check_quantity` decimal(14,2) DEFAULT NULL,
  `qualified_quantity` decimal(14,2) DEFAULT 0.00,
  `unqualified_quantity` decimal(14,2) DEFAULT 0.00,
  `critical_rate` decimal(14,2) DEFAULT 0.00,
  `major_rate` decimal(14,2) DEFAULT 0.00,
  `minor_rate` decimal(14,2) DEFAULT 0.00,
  `critical_quantity` int DEFAULT 0,
  `major_quantity` int DEFAULT 0,
  `minor_quantity` int DEFAULT 0,
  `check_result` tinyint DEFAULT NULL,
  `inspect_date` timestamp DEFAULT NULL,
  `inspector_user_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `remark` varchar(500) DEFAULT '',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_arrival_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `purchase_order_code` varchar(64) DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `arrival_date` timestamp DEFAULT NULL,
  `contact_name` varchar(64) DEFAULT NULL,
  `contact_telephone` varchar(64) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_batch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(128) DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `produce_date` timestamp DEFAULT NULL,
  `expire_date` timestamp DEFAULT NULL,
  `receipt_date` timestamp DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `sales_order_code` varchar(64) DEFAULT NULL,
  `purchase_order_code` varchar(64) DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `tool_id` bigint DEFAULT NULL,
  `mold_id` bigint DEFAULT NULL,
  `lot_number` varchar(128) DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_consume` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  `workstation_id` bigint NOT NULL,
  `process_id` bigint NOT NULL,
  `feedback_id` bigint NOT NULL,
  `consume_date` timestamp NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_consume_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consume_id` bigint NOT NULL,
  `line_id` bigint NOT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(128) DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  `area_id` bigint NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_consume_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consume_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(128) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `iqc_id` bigint DEFAULT NULL,
  `notice_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `purchase_order_code` varchar(64) DEFAULT NULL,
  `receipt_date` timestamp DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_receipt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `line_id` bigint NOT NULL,
  `receipt_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_item_receipt_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receipt_id` bigint NOT NULL,
  `arrival_notice_line_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `received_quantity` decimal(14,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expire_date` timestamp DEFAULT NULL,
  `lot_number` varchar(128) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_material_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_type_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `receipt_time` timestamp DEFAULT NULL,
  `frozen` bit DEFAULT FALSE,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_outsource_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `work_order_id` bigint DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `receipt_date` timestamp DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_product_produce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint DEFAULT NULL,
  `feedback_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `workstation_id` bigint DEFAULT NULL,
  `process_id` bigint DEFAULT NULL,
  `produce_date` timestamp DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_product_produce_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produce_id` bigint DEFAULT NULL,
  `line_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_product_produce_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produce_id` bigint DEFAULT NULL,
  `feedback_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `expire_date` timestamp DEFAULT NULL,
  `lot_number` varchar(128) DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_product_sales_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `line_id` bigint NOT NULL,
  `sales_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(14,2) DEFAULT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_product_sales_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sales_id` bigint NOT NULL,
  `notice_line_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(20,6) NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `oqc_check_flag` tinyint DEFAULT NULL,
  `oqc_id` bigint DEFAULT NULL,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_return_issue_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issue_id` bigint NOT NULL,
  `material_stock_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT 0.00,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `rqc_id` bigint DEFAULT NULL,
  `rqc_check_flag` bit NOT NULL DEFAULT FALSE,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT '',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mes/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `mes_wm_return_sales_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `return_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT 0.00,
  `batch_id` bigint DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `rqc_id` bigint DEFAULT NULL,
  `rqc_check_flag` bit NOT NULL DEFAULT FALSE,
  `quality_status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT '',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/app/PayAppDO.java
CREATE TABLE IF NOT EXISTS `pay_app` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_key`              varchar(64)   NOT NULL,
  `name`              varchar(64)   NOT NULL,
  `status`            tinyint       NOT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `order_notify_url` LONGTEXT DEFAULT NULL,
  `refund_notify_url` LONGTEXT DEFAULT NULL,
  `transfer_notify_url` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/channel/PayChannelDO.java
CREATE TABLE IF NOT EXISTS `pay_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code`        varchar(32)    NOT NULL,
  `status`      tinyint(4)     NOT NULL,
  `fee_rate` double DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `app_id`      bigint(20)     NOT NULL,
  `config` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/demo/PayDemoOrderDO.java
CREATE TABLE IF NOT EXISTS `pay_demo_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `spu_name` varchar(512) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `pay_status` bit(1) DEFAULT NULL,
  `pay_order_id` bigint DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_channel_code` varchar(512) DEFAULT NULL,
  `pay_refund_id` bigint DEFAULT NULL,
  `refund_price` int DEFAULT NULL,
  `refund_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/demo/PayDemoWithdrawDO.java
CREATE TABLE IF NOT EXISTS `pay_demo_withdraw` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(512) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `user_account` varchar(512) DEFAULT NULL,
  `user_name` varchar(512) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `pay_transfer_id` bigint DEFAULT NULL,
  `transfer_channel_code` varchar(512) DEFAULT NULL,
  `transfer_time` datetime DEFAULT NULL,
  `transfer_error_msg` varchar(512) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/notify/PayNotifyLogDO.java
CREATE TABLE IF NOT EXISTS `pay_notify_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id`             bigint(20)    NOT NULL,
  `notify_times`         int    NOT NULL,
  `response` LONGTEXT DEFAULT NULL,
  `status`             tinyint(4)    NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/notify/PayNotifyTaskDO.java
CREATE TABLE IF NOT EXISTS `pay_notify_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id`             bigint(20)    NOT NULL,
  `type`               tinyint(4)    NOT NULL,
  `data_id`           bigint(20)    NOT NULL,
  `merchant_order_id`           varchar(64)    NOT NULL,
  `merchant_refund_id` varchar(512) DEFAULT NULL,
  `merchant_transfer_id` varchar(512) DEFAULT NULL,
  `status`             tinyint(4)    NOT NULL,
  `next_notify_time` datetime DEFAULT NULL,
  `last_execute_time` datetime DEFAULT NULL,
  `notify_times`         int    NOT NULL,
  `max_notify_times`         int    NOT NULL,
  `notify_url` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/order/PayOrderDO.java
CREATE TABLE IF NOT EXISTS `pay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id`               bigint(20)    NOT NULL,
  `channel_id`           bigint(20)             DEFAULT NULL,
  `channel_code`         varchar(32)            DEFAULT NULL,
  `user_id`              bigint(20)             DEFAULT NULL,
  `user_type`            tinyint(4)             DEFAULT NULL,
  `merchant_order_id`    varchar(64)   NOT NULL,
  `subject`              varchar(32)   NOT NULL,
  `body`                 varchar(128)  NOT NULL,
  `notify_url` LONGTEXT DEFAULT NULL,
  `price`                bigint(20)    NOT NULL,
  `channel_fee_rate` double DEFAULT NULL,
  `channel_fee_price`    bigint(20)             DEFAULT 0,
  `status`               tinyint(4)    NOT NULL,
  `user_ip`              varchar(50)   NOT NULL,
  `expire_time` datetime DEFAULT NULL,
  `success_time` datetime DEFAULT NULL,
  `extension_id` bigint(20)             DEFAULT NULL,
  `no`                   varchar(64)   NULL,
  `refund_price`         bigint(20)    NOT NULL,
  `channel_user_id`      varchar(255)           DEFAULT NULL,
  `channel_order_no`     varchar(64)            DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/order/PayOrderExtensionDO.java
CREATE TABLE IF NOT EXISTS `pay_order_extension` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no`           varchar(64)         NOT NULL,
  `order_id`           bigint(20)    NOT NULL,
  `channel_id`         bigint(20)    NOT NULL,
  `channel_code`       varchar(32)   NOT NULL,
  `user_ip`            varchar(50)   NULL     DEFAULT NULL,
  `status`             tinyint(4)    NOT NULL,
  `channel_extras` LONGTEXT DEFAULT NULL,
  `channel_error_code`  varchar(64)  NULL,
  `channel_error_msg` varchar(64)    NULL,
  `channel_notify_data` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/refund/PayRefundDO.java
CREATE TABLE IF NOT EXISTS `pay_refund` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no`           varchar(64)         NOT NULL,
  `app_id`             bigint(20)    NOT NULL,
  `channel_id`         bigint(20)    NOT NULL,
  `channel_code`       varchar(32)   NOT NULL,
  `order_id`           bigint(20)    NOT NULL,
  `order_no`           varchar(64)    NOT NULL,
  `user_id`            bigint(20)    NULL     DEFAULT NULL,
  `user_type`          tinyint(4)    NULL     DEFAULT NULL,
  `merchant_order_id`  varchar(64)   NOT NULL,
  `merchant_refund_id` varchar(64)   NOT NULL,
  `notify_url` LONGTEXT DEFAULT NULL,
  `status`             tinyint(4)    NOT NULL,
  `pay_price`         bigint(20)    NOT NULL,
  `refund_price`      bigint(20)    NOT NULL,
  `reason` LONGTEXT DEFAULT NULL,
  `user_ip`            varchar(50)   NULL     DEFAULT NULL,
  `channel_order_no`   varchar(64)   NOT NULL,
  `channel_refund_no`  varchar(64)   NULL     DEFAULT NULL,
  `success_time` datetime DEFAULT NULL,
  `channel_error_code` varchar(128)  NULL     DEFAULT NULL,
  `channel_error_msg`  varchar(256)  NULL     DEFAULT NULL,
  `channel_notify_data` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/transfer/PayTransferDO.java
CREATE TABLE IF NOT EXISTS `pay_transfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no`                   varchar(64)   NOT NULL,
  `app_id`               bigint(20)    NOT NULL,
  `channel_id`           bigint(20)    NOT NULL,
  `channel_code`         varchar(32)   NOT NULL,
  `user_id`              bigint(20)    NULL     DEFAULT NULL,
  `user_type`            tinyint(4)    NULL     DEFAULT NULL,
  `merchant_transfer_id` varchar(64)   NOT NULL,
  `subject`              varchar(256)  NOT NULL,
  `price`                bigint(20)    NOT NULL,
  `user_account`         varchar(256)  NOT NULL,
  `user_name`            varchar(64)   NULL     DEFAULT NULL,
  `status`               tinyint(4)    NOT NULL,
  `success_time` datetime DEFAULT NULL,
  `notify_url` LONGTEXT DEFAULT NULL,
  `user_ip`              varchar(50)   NULL     DEFAULT NULL,
  `channel_extras` LONGTEXT DEFAULT NULL,
  `channel_transfer_no`  varchar(64)   NULL     DEFAULT NULL,
  `channel_error_code`   varchar(128)  NULL     DEFAULT NULL,
  `channel_error_msg`    varchar(256)  NULL     DEFAULT NULL,
  `channel_notify_data` LONGTEXT DEFAULT NULL,
  `channel_package_info` varchar(1024) NULL     DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/wallet/PayWalletDO.java
CREATE TABLE IF NOT EXISTS `pay_wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `user_type` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  `freeze_price` int DEFAULT NULL,
  `total_expense` int DEFAULT NULL,
  `total_recharge` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/wallet/PayWalletRechargeDO.java
CREATE TABLE IF NOT EXISTS `pay_wallet_recharge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `pay_price` int DEFAULT NULL,
  `bonus_price` int DEFAULT NULL,
  `package_id` bigint DEFAULT NULL,
  `pay_status` bit(1) DEFAULT NULL,
  `pay_order_id` bigint DEFAULT NULL,
  `pay_channel_code` varchar(512) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_refund_id` bigint DEFAULT NULL,
  `refund_total_price` int DEFAULT NULL,
  `refund_pay_price` int DEFAULT NULL,
  `refund_bonus_price` int DEFAULT NULL,
  `refund_time` datetime DEFAULT NULL,
  `refund_status` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/wallet/PayWalletRechargePackageDO.java
CREATE TABLE IF NOT EXISTS `pay_wallet_recharge_package` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `pay_price` int DEFAULT NULL,
  `bonus_price` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pay/src/main/java/com/lxzy/nomix/module/pay/dal/dataobject/wallet/PayWalletTransactionDO.java
CREATE TABLE IF NOT EXISTS `pay_wallet_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(512) DEFAULT NULL,
  `wallet_id` bigint DEFAULT NULL,
  `biz_type` int DEFAULT NULL,
  `biz_id` varchar(512) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `balance` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_iteration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner_user_id` bigint DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `finish_time` timestamp DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_content_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `open_status` bit NOT NULL DEFAULT TRUE,
  `open_level` tinyint NOT NULL DEFAULT 3,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_content_permission_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL,
  `level` tinyint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  `folder_id` bigint NOT NULL DEFAULT 0,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `type` int NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  `label_ids` LONGTEXT DEFAULT NULL,
  `delete_user_id` bigint DEFAULT NULL,
  `delete_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_document_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `main_id` bigint NOT NULL DEFAULT 0,
  `reply_user_id` bigint DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_document_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_document_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_like_tenant_document_create_time` (`tenant_id`, `document_id`, `create_time`),
  KEY `idx_like_tenant_user_document` (`tenant_id`, `user_id`, `document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_document_share` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `share_user_ids` LONGTEXT DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `close_user_id` bigint DEFAULT NULL,
  `close_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`token`),
  KEY `idx_share_tenant_document` (`tenant_id`, `document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `type` int NOT NULL,
  `entity_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_favorite_tenant_user_create_time_id` (`tenant_id`, `user_id`, `create_time`, `id`),
  KEY `idx_favorite_tenant_user_library_create_time_id` (`tenant_id`, `user_id`, `library_id`, `create_time`, `id`),
  KEY `idx_favorite_tenant_user_type_entity` (`tenant_id`, `user_id`, `type`, `entity_id`),
  KEY `idx_favorite_tenant_library` (`tenant_id`, `library_id`),
  KEY `idx_favorite_tenant_type_entity` (`tenant_id`, `type`, `entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_folder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `delete_user_id` bigint DEFAULT NULL,
  `delete_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `type` tinyint NOT NULL DEFAULT 3,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_group_tenant_user_type` (`tenant_id`, `user_id`, `type`),
  KEY `idx_group_tenant_user_sort` (`tenant_id`, `user_id`, `sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_group_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `library_id` bigint NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_group_relation_tenant_user_group_library` (`tenant_id`, `user_id`, `group_id`, `library_id`),
  KEY `idx_group_relation_tenant_user_library` (`tenant_id`, `user_id`, `library_id`),
  KEY `idx_group_relation_tenant_library` (`tenant_id`, `library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_library` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `open_status` bit NOT NULL DEFAULT FALSE,
  `cover_url` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  `delete_user_id` bigint DEFAULT NULL,
  `delete_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_library_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL,
  `level` int NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_library_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `sort` int NOT NULL DEFAULT 0,
  `documents` LONGTEXT NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_recycle_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `type` int NOT NULL,
  `entity_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `delete_user_id` bigint NOT NULL,
  `delete_time` timestamp NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_type_entity` (`tenant_id`, `type`, `entity_id`),
  KEY `idx_tenant_delete_time_id` (`tenant_id`, `delete_time`, `id`),
  KEY `idx_tenant_library_delete_time` (`tenant_id`, `library_id`, `delete_time`),
  KEY `idx_tenant_delete_user_type` (`tenant_id`, `delete_user_id`, `type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_knowledge_view_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `library_id` bigint NOT NULL,
  `type` int NOT NULL,
  `entity_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_view_tenant_user_create_time_id` (`tenant_id`, `user_id`, `create_time`, `id`),
  KEY `idx_view_tenant_user_type_entity` (`tenant_id`, `user_id`, `type`, `entity_id`),
  KEY `idx_view_tenant_library_create_time_id` (`tenant_id`, `library_id`, `create_time`, `id`),
  KEY `idx_view_tenant_type_entity` (`tenant_id`, `type`, `entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `type` int NOT NULL,
  `level` int NOT NULL,
  `description` text DEFAULT NULL,
  `open_status` bit NOT NULL DEFAULT TRUE,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `archive_time` timestamp DEFAULT NULL,
  `recycle_time` timestamp DEFAULT NULL,
  `access_time` timestamp DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_announcement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `content` text NOT NULL,
  `file_urls` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `type` tinyint NOT NULL DEFAULT 3,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_group_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `level` tinyint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_project_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `project_type` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `sort` int NOT NULL DEFAULT 0,
  `item_types` LONGTEXT NOT NULL,
  `statuses` LONGTEXT NOT NULL,
  `boards` LONGTEXT NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `type` int NOT NULL,
  `serial_number` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` int NOT NULL,
  `assignee_user_id` bigint DEFAULT NULL,
  `status_id` bigint NOT NULL,
  `status` int NOT NULL,
  `lifecycle_status` int NOT NULL DEFAULT 1,
  `archive_time` timestamp DEFAULT NULL,
  `recycle_time` timestamp DEFAULT NULL,
  `iteration_id` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `related_requirement_id` bigint DEFAULT NULL,
  `defect_type` int DEFAULT NULL,
  `start_time` timestamp DEFAULT NULL,
  `end_time` timestamp DEFAULT NULL,
  `estimated_hours` int DEFAULT NULL,
  `progress` int NOT NULL DEFAULT 0,
  `file_urls` LONGTEXT DEFAULT NULL,
  `label_ids` LONGTEXT DEFAULT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_id` bigint NOT NULL,
  `operator_user_id` bigint NOT NULL,
  `content` varchar(500) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_board` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_type` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `work_item_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `main_id` bigint NOT NULL DEFAULT 0,
  `reply_user_id` bigint DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_type` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `status_type` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `board_name` varchar(50) DEFAULT NULL,
  `system_code` varchar(20) DEFAULT NULL,
  `default_status` bit NOT NULL DEFAULT FALSE,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_user_sort` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `sort` int NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-pms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `pms_work_item_work_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `work_item_id` bigint NOT NULL,
  `actual_hours` int NOT NULL,
  `remaining_hours` int NOT NULL DEFAULT 0,
  `description` varchar(500) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/brand/ProductBrandDO.java
CREATE TABLE IF NOT EXISTS `product_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) NOT NULL COMMENT '品牌名称',
  `pic_url` LONGTEXT DEFAULT NULL,
  `sort` int DEFAULT '0' COMMENT '品牌排序',
  `description` LONGTEXT DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/history/ProductBrowseHistoryDO.java
CREATE TABLE IF NOT EXISTS `product_browse_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spu_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_deleted` bit(1) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/category/ProductCategoryDO.java
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint NOT NULL COMMENT '父分类编号',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `pic_url` LONGTEXT DEFAULT NULL,
  `sort` int DEFAULT '0' COMMENT '分类排序',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/comment/ProductCommentDO.java
CREATE TABLE IF NOT EXISTS `product_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论编号，主键自增',
  `user_id` bigint DEFAULT NULL COMMENT '评价人的用户编号关联 MemberUserDO 的 id 编号',
  `user_nickname` varchar(255) DEFAULT NULL COMMENT '评价人名称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评价人头像',
  `anonymous` bit(1) DEFAULT NULL COMMENT '是否匿名',
  `order_id` bigint DEFAULT NULL COMMENT '交易订单编号关联 TradeOrderDO 的 id 编号',
  `order_item_id` bigint DEFAULT NULL COMMENT '交易订单项编号关联 TradeOrderItemDO 的 id 编号',
  `spu_id` bigint DEFAULT NULL COMMENT '商品 SPU 编号关联 ProductSpuDO 的 id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint DEFAULT NULL COMMENT '商品 SKU 编号关联 ProductSkuDO 的 id 编号',
  `sku_pic_url` LONGTEXT DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL COMMENT '是否可见true:显示false:隐藏',
  `scores` tinyint DEFAULT NULL COMMENT '评分星级1-5分',
  `description_scores` tinyint DEFAULT NULL COMMENT '描述星级1-5 星',
  `benefit_scores` tinyint DEFAULT NULL COMMENT '服务星级1-5 星',
  `content` LONGTEXT DEFAULT NULL,
  `pic_urls` LONGTEXT DEFAULT NULL,
  `reply_status` bit(1) DEFAULT NULL COMMENT '商家是否回复',
  `reply_user_id` bigint DEFAULT NULL COMMENT '回复管理员编号关联 AdminUserDO 的 id 编号',
  `reply_content` LONGTEXT DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/favorite/ProductFavoriteDO.java
CREATE TABLE IF NOT EXISTS `product_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/property/ProductPropertyDO.java
CREATE TABLE IF NOT EXISTS `product_property` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `remark` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/property/ProductPropertyValueDO.java
CREATE TABLE IF NOT EXISTS `product_property_value` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `property_id` bigint DEFAULT NULL COMMENT '规格键id',
  `name` varchar(128) DEFAULT NULL COMMENT '规格值名字',
  `remark` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/sku/ProductSkuDO.java
CREATE TABLE IF NOT EXISTS `product_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spu_id` bigint NOT NULL COMMENT 'spu编号',
  `properties` LONGTEXT DEFAULT NULL,
  `price` int NOT NULL DEFAULT '-1' COMMENT '商品价格，单位：分',
  `market_price` int DEFAULT NULL COMMENT '市场价，单位：分',
  `cost_price` int NOT NULL DEFAULT '-1' COMMENT '成本价，单位： 分',
  `bar_code` varchar(64)  DEFAULT NULL COMMENT 'SKU 的条形码',
  `pic_url` LONGTEXT DEFAULT NULL,
  `stock` int DEFAULT NULL COMMENT '库存',
  `weight` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `first_brokerage_price` int DEFAULT NULL,
  `second_brokerage_price` int DEFAULT NULL,
  `sales_count` int DEFAULT NULL COMMENT '商品销量',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-product/src/main/java/com/lxzy/nomix/module/product/dal/dataobject/spu/ProductSpuDO.java
CREATE TABLE IF NOT EXISTS `product_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品 SPU 编号，自增',
  `name` varchar(128) NOT NULL COMMENT '商品名称',
  `keyword` varchar(256) NOT NULL COMMENT '关键字',
  `introduction` varchar(256) NOT NULL COMMENT '商品简介',
  `description` LONGTEXT DEFAULT NULL,
  `category_id` bigint NOT NULL COMMENT '商品分类编号',
  `brand_id` int DEFAULT NULL COMMENT '商品品牌编号',
  `pic_url` LONGTEXT DEFAULT NULL,
  `slider_pic_urls` LONGTEXT DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序字段',
  `status` tinyint NOT NULL COMMENT '商品状态: 0 上架（开启） 1 下架（禁用）-1 回收',
  `spec_type` bit(1) NOT NULL COMMENT '规格类型：0 单规格 1 多规格',
  `price` int NOT NULL DEFAULT '-1' COMMENT '商品价格，单位使用：分',
  `market_price` int NOT NULL COMMENT '市场价，单位使用：分',
  `cost_price` int NOT NULL DEFAULT '-1' COMMENT '成本价，单位： 分',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存',
  `delivery_types` LONGTEXT DEFAULT NULL,
  `delivery_template_id` bigint NOT NULL COMMENT '物流配置模板编号',
  `give_integral` int NOT NULL COMMENT '赠送积分',
  `sub_commission_type` bit(1) NOT NULL COMMENT '分销类型',
  `sales_count` int DEFAULT '0' COMMENT '商品销量',
  `virtual_sales_count` int DEFAULT '0' COMMENT '虚拟销量',
  `browse_count` int DEFAULT '0' COMMENT '商品点击量',
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-statistics/src/main/java/com/lxzy/nomix/module/statistics/dal/dataobject/product/ProductStatisticsDO.java
CREATE TABLE IF NOT EXISTS `product_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `browse_count` int DEFAULT NULL,
  `browse_user_count` int DEFAULT NULL,
  `favorite_count` int DEFAULT NULL,
  `cart_count` int DEFAULT NULL,
  `order_count` int DEFAULT NULL,
  `order_pay_count` int DEFAULT NULL,
  `order_pay_price` int DEFAULT NULL,
  `after_sale_count` int DEFAULT NULL,
  `after_sale_refund_price` int DEFAULT NULL,
  `browse_convert_percent` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/article/ArticleDO.java
CREATE TABLE IF NOT EXISTS `promotion_article` (
  `id`               bigint   NOT NULL AUTO_INCREMENT,
  `category_id`      bigint   NOT NULL,
  `spu_id`           bigint   NOT NULL,
  `title`            varchar(255)  NOT NULL,
  `author`           varchar(255),
  `pic_url` LONGTEXT DEFAULT NULL,
  `introduction`     varchar(255),
  `browse_count` int DEFAULT NULL,
  `sort`             int      NOT NULL,
  `status`           int      NOT NULL,
  `recommend_hot`    bit      NOT NULL,
  `recommend_banner` bit      NOT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/article/ArticleCategoryDO.java
CREATE TABLE IF NOT EXISTS `promotion_article_category` (
  `id`          bigint   NOT NULL AUTO_INCREMENT,
  `name`        varchar(255)  NOT NULL,
  `pic_url` LONGTEXT DEFAULT NULL,
  `status`      int      NOT NULL,
  `sort`        int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/banner/BannerDO.java
CREATE TABLE IF NOT EXISTS `promotion_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(512) DEFAULT NULL,
  `url` LONGTEXT DEFAULT NULL,
  `pic_url` LONGTEXT DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `memo` varchar(512) DEFAULT NULL,
  `browse_count` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/bargain/BargainActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_bargain_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `bargain_first_price` int DEFAULT NULL,
  `bargain_min_price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `total_stock` int DEFAULT NULL,
  `help_max_count` int DEFAULT NULL,
  `bargain_count` int DEFAULT NULL,
  `total_limit_count` int DEFAULT NULL,
  `random_min_price` int DEFAULT NULL,
  `random_max_price` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/bargain/BargainHelpDO.java
CREATE TABLE IF NOT EXISTS `promotion_bargain_help` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` bigint DEFAULT NULL,
  `record_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `reduce_price` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/bargain/BargainRecordDO.java
CREATE TABLE IF NOT EXISTS `promotion_bargain_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `activity_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `bargain_first_price` int DEFAULT NULL,
  `bargain_price` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/combination/CombinationActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_combination_activity` (
  `id`                 bigint   NOT NULL AUTO_INCREMENT,
  `name`               varchar(255)  NOT NULL,
  `spu_id`             bigint,
  `total_limit_count`  int      NOT NULL,
  `single_limit_count` int      NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_size`          int      NOT NULL,
  `virtual_group`      int      NOT NULL,
  `status`             int      NOT NULL,
  `limit_duration`     int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/combination/CombinationProductDO.java
CREATE TABLE IF NOT EXISTS `promotion_combination_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `combination_price` int DEFAULT NULL,
  `activity_status` int DEFAULT NULL,
  `activity_start_time` datetime DEFAULT NULL,
  `activity_end_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/combination/CombinationRecordDO.java
CREATE TABLE IF NOT EXISTS `promotion_combination_record` (
  `id`                bigint   NOT NULL AUTO_INCREMENT,
  `activity_id`       bigint   NOT NULL,
  `combination_price` int      NOT NULL,
  `spu_id`            bigint   NOT NULL,
  `spu_name`          varchar(255)  NOT NULL,
  `pic_url` LONGTEXT DEFAULT NULL,
  `sku_id`            bigint   NOT NULL,
  `count`             int      NOT NULL,
  `user_id`           bigint   NOT NULL,
  `nickname`          varchar(255),
  `avatar`            varchar(255),
  `head_id`           bigint   NOT NULL,
  `status`            int      NOT NULL,
  `order_id`          bigint   NOT NULL,
  `user_size`         int      NOT NULL,
  `user_count`        int      NOT NULL,
  `virtual_group`     bit      NOT NULL,
  `expire_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/coupon/CouponDO.java
CREATE TABLE IF NOT EXISTS `promotion_coupon` (
  `id`                   bigint   NOT NULL AUTO_INCREMENT,
  `template_id`          bigint   NOT NULL,
  `name`                 varchar(255)  NOT NULL,
  `status`               int      NOT NULL,
  `user_id`              bigint   NOT NULL,
  `take_type`            int      NOT NULL,
  `use_price`            int      NOT NULL,
  `valid_start_time` datetime DEFAULT NULL,
  `valid_end_time` datetime DEFAULT NULL,
  `product_scope`        int      NOT NULL,
  `product_scope_values` LONGTEXT DEFAULT NULL,
  `discount_type`        int      NOT NULL,
  `discount_percent`     int,
  `discount_price`       int,
  `discount_limit_price` int,
  `use_order_id`         bigint,
  `use_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/coupon/CouponTemplateDO.java
CREATE TABLE IF NOT EXISTS `promotion_coupon_template` (
  `id`                   bigint   NOT NULL AUTO_INCREMENT,
  `name`                 varchar(255)  NOT NULL,
  `description` LONGTEXT DEFAULT NULL,
  `status`               int      NOT NULL,
  `total_count`          int      NOT NULL,
  `take_limit_count`     int      NOT NULL,
  `take_type`            int      NOT NULL,
  `use_price`            int      NOT NULL,
  `product_scope`        int      NOT NULL,
  `product_scope_values` LONGTEXT DEFAULT NULL,
  `validity_type`        int      NOT NULL,
  `valid_start_time` datetime DEFAULT NULL,
  `valid_end_time` datetime DEFAULT NULL,
  `fixed_start_term`     int,
  `fixed_end_term`       int,
  `discount_type`        int      NOT NULL,
  `discount_percent`     int,
  `discount_price`       int,
  `discount_limit_price` int,
  `take_count`           int      NOT NULL DEFAULT 0,
  `use_count`            int      NOT NULL DEFAULT 0,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/discount/DiscountActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_discount_activity` (
  `id`          bigint   NOT NULL AUTO_INCREMENT,
  `name`        varchar(255)  NOT NULL,
  `status`      int      NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/discount/DiscountProductDO.java
CREATE TABLE IF NOT EXISTS `promotion_discount_product` (
  `id`                  bigint   NOT NULL AUTO_INCREMENT,
  `activity_id`         bigint   NOT NULL,
  `spu_id`              bigint   NOT NULL,
  `sku_id`              bigint   NOT NULL,
  `discount_type`       int      NOT NULL,
  `discount_percent`    int,
  `discount_price`      int,
  `activity_name`       varchar(255)  NOT NULL,
  `activity_status`     int      NOT NULL,
  `activity_start_time` datetime DEFAULT NULL,
  `activity_end_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/diy/DiyPageDO.java
CREATE TABLE IF NOT EXISTS `promotion_diy_page` (
  `id`                 bigint   NOT NULL AUTO_INCREMENT,
  `template_id`        bigint   NOT NULL,
  `name`               varchar(255)  NOT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `preview_pic_urls` LONGTEXT DEFAULT NULL,
  `property` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/diy/DiyTemplateDO.java
CREATE TABLE IF NOT EXISTS `promotion_diy_template` (
  `id`                 bigint   NOT NULL AUTO_INCREMENT,
  `name`               varchar(255)  NOT NULL,
  `used`               bit      NOT NULL,
  `used_time` datetime DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `preview_pic_urls` LONGTEXT DEFAULT NULL,
  `property` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/kefu/KeFuConversationDO.java
CREATE TABLE IF NOT EXISTS `promotion_kefu_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `last_message_time` datetime DEFAULT NULL,
  `last_message_content` LONGTEXT DEFAULT NULL,
  `last_message_content_type` int DEFAULT NULL,
  `admin_pinned` bit(1) DEFAULT NULL,
  `user_deleted` bit(1) DEFAULT NULL,
  `admin_deleted` bit(1) DEFAULT NULL,
  `admin_unread_message_count` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/kefu/KeFuMessageDO.java
CREATE TABLE IF NOT EXISTS `promotion_kefu_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  `sender_type` int DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `receiver_type` int DEFAULT NULL,
  `content_type` int DEFAULT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `read_status` bit(1) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/point/PointActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_point_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spu_id` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `total_stock` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/point/PointProductDO.java
CREATE TABLE IF NOT EXISTS `promotion_point_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `count` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `activity_status` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/reward/RewardActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_reward_activity` (
  `id`              bigint   NOT NULL AUTO_INCREMENT,
  `name`            varchar(255)  NOT NULL,
  `status`          int      NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `condition_type`  int      NOT NULL,
  `product_scope`   int      NOT NULL,
  `product_scope_values` LONGTEXT DEFAULT NULL,
  `rules` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/seckill/SeckillActivityDO.java
CREATE TABLE IF NOT EXISTS `promotion_seckill_activity` (
  `id`                 bigint   NOT NULL AUTO_INCREMENT,
  `spu_id`             bigint   NOT NULL,
  `name`               varchar(255)  NOT NULL,
  `status`             int      NOT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `sort`               int      NOT NULL,
  `config_ids` LONGTEXT DEFAULT NULL,
  `total_limit_count`  int,
  `single_limit_count` int,
  `stock`              int,
  `total_stock`        int,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/seckill/SeckillConfigDO.java
CREATE TABLE IF NOT EXISTS `promotion_seckill_config` (
  `id`          bigint   NOT NULL AUTO_INCREMENT,
  `name`        varchar(255)  NOT NULL,
  `start_time`  varchar(255)  NOT NULL,
  `end_time`    varchar(255)  NOT NULL,
  `slider_pic_urls` LONGTEXT DEFAULT NULL,
  `status`      int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-promotion/src/main/java/com/lxzy/nomix/module/promotion/dal/dataobject/seckill/SeckillProductDO.java
CREATE TABLE IF NOT EXISTS `promotion_seckill_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` bigint DEFAULT NULL,
  `config_ids` LONGTEXT DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `seckill_price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `activity_status` int DEFAULT NULL,
  `activity_start_time` datetime DEFAULT NULL,
  `activity_end_time` datetime DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-report/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `report_go_view_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pic_url` varchar(255),
  `content` varchar(255),
  `status` varchar(255) NOT NULL,
  `remark` varchar(255),
  `creator` varchar(255) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(255) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-system/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `system_user_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_type` tinyint NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(50) DEFAULT NULL,
  `user_agent` varchar(512) DEFAULT NULL,
  `session_timeout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint not null default  '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/aftersale/AfterSaleDO.java
CREATE TABLE IF NOT EXISTS `trade_after_sale` (
  `id`             bigint   NOT NULL AUTO_INCREMENT,
  `no`             varchar(255)  NOT NULL,
  `status`         int      NOT NULL,
  `way`            int      NOT NULL,
  `type`           int      NOT NULL,
  `user_id`        bigint   NOT NULL,
  `apply_reason` LONGTEXT DEFAULT NULL,
  `apply_description` LONGTEXT DEFAULT NULL,
  `apply_pic_urls` LONGTEXT DEFAULT NULL,
  `order_id`       bigint   NOT NULL,
  `order_no`       varchar(255)  NOT NULL,
  `order_item_id`  bigint   NOT NULL,
  `spu_id`         bigint   NOT NULL,
  `spu_name`       varchar(255)  NOT NULL,
  `sku_id`         bigint   NOT NULL,
  `pic_url` LONGTEXT DEFAULT NULL,
  `count`          int      NOT NULL,
  `audit_time` datetime DEFAULT NULL,
  `audit_user_id`  bigint,
  `audit_reason` LONGTEXT DEFAULT NULL,
  `refund_price`   int      NOT NULL,
  `pay_refund_id`  bigint,
  `refund_time` datetime DEFAULT NULL,
  `logistics_id`   bigint,
  `logistics_no`   varchar(255),
  `delivery_time` datetime DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `receive_reason` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/aftersale/AfterSaleLogDO.java
CREATE TABLE IF NOT EXISTS `trade_after_sale_log` (
  `id`            bigint   NOT NULL AUTO_INCREMENT,
  `user_id`       bigint   NOT NULL,
  `user_type`     int      NOT NULL,
  `after_sale_id` bigint   NOT NULL,
  `before_status` int,
  `after_status`  int      NOT NULL,
  `operate_type` int DEFAULT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/brokerage/BrokerageRecordDO.java
CREATE TABLE IF NOT EXISTS `trade_brokerage_record` (
  `id`            bigint   NOT NULL AUTO_INCREMENT,
  `user_id`       bigint   NOT NULL,
  `biz_id`        varchar(255)  NOT NULL,
  `biz_type` int DEFAULT NULL,
  `title`         varchar(255)  NOT NULL,
  `description` LONGTEXT DEFAULT NULL,
  `price`         int      NOT NULL,
  `total_price`   int      NOT NULL,
  `status` int DEFAULT NULL,
  `frozen_days`   int      NOT NULL,
  `unfreeze_time` datetime DEFAULT NULL,
  `source_user_level` int,
  `source_user_id`    bigint,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/brokerage/BrokerageUserDO.java
CREATE TABLE IF NOT EXISTS `trade_brokerage_user` (
  `id`                bigint   NOT NULL AUTO_INCREMENT,
  `bind_user_id`      bigint   NOT NULL,
  `bind_user_time` datetime DEFAULT NULL,
  `brokerage_enabled` bit      NOT NULL,
  `brokerage_time` datetime DEFAULT NULL,
  `brokerage_price` int DEFAULT NULL,
  `frozen_price`      int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/brokerage/BrokerageWithdrawDO.java
CREATE TABLE IF NOT EXISTS `trade_brokerage_withdraw` (
  `id`                  int      NOT NULL AUTO_INCREMENT,
  `user_id`             bigint   NOT NULL,
  `price`               int      NOT NULL,
  `fee_price`           int      NOT NULL,
  `total_price`         int      NOT NULL,
  `type` int DEFAULT NULL,
  `user_name` varchar(512) DEFAULT NULL,
  `user_account` varchar(512) DEFAULT NULL,
  `qr_code_url` LONGTEXT DEFAULT NULL,
  `bank_name`           varchar(255),
  `bank_address`        varchar(255),
  `status` int DEFAULT NULL,
  `audit_reason` LONGTEXT DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  `remark` LONGTEXT DEFAULT NULL,
  `pay_transfer_id` bigint DEFAULT NULL,
  `transfer_channel_code` varchar(512) DEFAULT NULL,
  `transfer_time` datetime DEFAULT NULL,
  `transfer_error_msg` varchar(512) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/cart/CartDO.java
CREATE TABLE IF NOT EXISTS `trade_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `spu_id` bigint DEFAULT NULL,
  `sku_id` bigint DEFAULT NULL,
  `count` int DEFAULT NULL,
  `selected` bit(1) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/config/TradeConfigDO.java
CREATE TABLE IF NOT EXISTS `trade_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `after_sale_refund_reasons` LONGTEXT DEFAULT NULL,
  `after_sale_return_reasons` LONGTEXT DEFAULT NULL,
  `delivery_express_free_enabled` bit(1) DEFAULT NULL,
  `delivery_express_free_price` int DEFAULT NULL,
  `delivery_pick_up_enabled` bit(1) DEFAULT NULL,
  `brokerage_enabled` bit(1) DEFAULT NULL,
  `brokerage_enabled_condition` int DEFAULT NULL,
  `brokerage_bind_mode` int DEFAULT NULL,
  `brokerage_poster_urls` LONGTEXT DEFAULT NULL,
  `brokerage_first_percent` int DEFAULT NULL,
  `brokerage_second_percent` int DEFAULT NULL,
  `brokerage_withdraw_min_price` int DEFAULT NULL,
  `brokerage_withdraw_fee_percent` int DEFAULT NULL,
  `brokerage_frozen_days` int DEFAULT NULL,
  `brokerage_withdraw_types` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/delivery/DeliveryExpressDO.java
CREATE TABLE IF NOT EXISTS `trade_delivery_express` (
  `id`          int      NOT NULL AUTO_INCREMENT,
  `code`        varchar(255)  NULL,
  `name`        varchar(255),
  `logo`        varchar(255)  NULL,
  `sort`        int      NOT NULL,
  `status`      int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/delivery/DeliveryExpressTemplateDO.java
CREATE TABLE IF NOT EXISTS `trade_delivery_express_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `charge_mode` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/delivery/DeliveryExpressTemplateChargeDO.java
CREATE TABLE IF NOT EXISTS `trade_delivery_express_template_charge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_id` bigint DEFAULT NULL,
  `area_ids` LONGTEXT DEFAULT NULL,
  `charge_mode` int DEFAULT NULL,
  `start_count` double DEFAULT NULL,
  `start_price` int DEFAULT NULL,
  `extra_count` double DEFAULT NULL,
  `extra_price` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/delivery/DeliveryExpressTemplateFreeDO.java
CREATE TABLE IF NOT EXISTS `trade_delivery_express_template_free` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_id` bigint DEFAULT NULL,
  `area_ids` LONGTEXT DEFAULT NULL,
  `free_price` int DEFAULT NULL,
  `free_count` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/delivery/DeliveryPickUpStoreDO.java
CREATE TABLE IF NOT EXISTS `trade_delivery_pick_up_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `introduction` varchar(512) DEFAULT NULL,
  `phone` varchar(512) DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `detail_address` varchar(512) DEFAULT NULL,
  `logo` varchar(512) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `verify_user_ids` LONGTEXT DEFAULT NULL,
  `status` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/order/TradeOrderDO.java
CREATE TABLE IF NOT EXISTS `trade_order` (
  `id`                      bigint   NOT NULL AUTO_INCREMENT,
  `no`                      varchar(255)  NOT NULL,
  `type`                    int      NOT NULL,
  `terminal`                int      NOT NULL,
  `user_id`                 bigint   NOT NULL,
  `user_ip`                 varchar(255)  NOT NULL,
  `user_remark` LONGTEXT DEFAULT NULL,
  `status`                  int      NOT NULL,
  `product_count`           int      NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_type`             int,
  `remark` LONGTEXT DEFAULT NULL,
  `comment_status`          boolean,
  `brokerage_user_id`       bigint,
  `pay_order_id`            bigint,
  `pay_status`              bit      NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_channel_code`        varchar(255),
  `total_price`             int      NULL,
  `discount_price`          int      NOT NULL,
  `delivery_price`          int      NOT NULL,
  `adjust_price`            int      NOT NULL,
  `pay_price`               int      NOT NULL,
  `delivery_type`           int      NOT NULL,
  `logistics_id`            bigint,
  `logistics_no`            varchar(255),
  `delivery_time` datetime DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `receiver_name`           varchar(255)  NOT NULL,
  `receiver_mobile`         varchar(255)  NOT NULL,
  `receiver_area_id`        int      NOT NULL,
  `receiver_detail_address` varchar(255)  NOT NULL,
  `pick_up_store_id`        bigint     NULL,
  `pick_up_verify_code`     varchar(255)  NULL,
  `refund_status`           int      NULL,
  `refund_price`            int      NULL,
  `coupon_id`               bigint   NOT NULL,
  `coupon_price`            int      NOT NULL,
  `use_point`               int      NULL,
  `point_price`             int      NOT NULL,
  `give_point`              int      NULL,
  `refund_point`            int      NULL,
  `vip_price`               int      NULL,
  `give_coupon_template_counts` LONGTEXT DEFAULT NULL,
  `give_coupon_ids` LONGTEXT DEFAULT NULL,
  `seckill_activity_id`     bigint     NULL,
  `bargain_activity_id`     bigint     NULL,
  `bargain_record_id`       bigint     NULL,
  `combination_activity_id` bigint     NULL,
  `combination_head_id`     bigint     NULL,
  `combination_record_id`   bigint     NULL,
  `point_activity_id` bigint DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/order/TradeOrderItemDO.java
CREATE TABLE IF NOT EXISTS `trade_order_item` (
  `id`                bigint   NOT NULL AUTO_INCREMENT,
  `user_id`           bigint   NOT NULL,
  `order_id`          bigint   NOT NULL,
  `cart_id`           int      NULL,
  `spu_id`            bigint   NOT NULL,
  `spu_name`          varchar(255)  NOT NULL,
  `sku_id`            bigint   NOT NULL,
  `properties` LONGTEXT DEFAULT NULL,
  `pic_url` LONGTEXT DEFAULT NULL,
  `count`             int      NOT NULL,
  `comment_status`    boolean  NULL,
  `price`             int      NOT NULL,
  `discount_price`    int      NOT NULL,
  `delivery_price`    int      NULL,
  `adjust_price`      int      NULL,
  `pay_price`         int      NOT NULL,
  `coupon_price`      int      NULL,
  `point_price`       int      NULL,
  `use_point`         int      NULL,
  `give_point`        int      NULL,
  `vip_price`         int      NULL,
  `after_sale_id`     bigint     NULL,
  `after_sale_status` int      NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-trade/src/main/java/com/lxzy/nomix/module/trade/dal/dataobject/order/TradeOrderLogDO.java
CREATE TABLE IF NOT EXISTS `trade_order_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `user_type` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `before_status` int DEFAULT NULL,
  `after_status` int DEFAULT NULL,
  `operate_type` int DEFAULT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-mall/nomix-module-statistics/src/main/java/com/lxzy/nomix/module/statistics/dal/dataobject/trade/TradeStatisticsDO.java
CREATE TABLE IF NOT EXISTS `trade_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `order_create_count` int DEFAULT NULL,
  `order_pay_count` int DEFAULT NULL,
  `order_pay_price` int DEFAULT NULL,
  `after_sale_count` int DEFAULT NULL,
  `after_sale_refund_price` int DEFAULT NULL,
  `brokerage_settlement_price` int DEFAULT NULL,
  `wallet_pay_price` int DEFAULT NULL,
  `recharge_pay_count` int DEFAULT NULL,
  `recharge_pay_price` int DEFAULT NULL,
  `recharge_refund_count` int DEFAULT NULL,
  `recharge_refund_price` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` bit(1) NOT NULL DEFAULT 0,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_check_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `total_price` decimal(16, 2) DEFAULT NULL,
  `actual_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_check_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `inventory_id` bigint DEFAULT NULL,
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expiration_date` timestamp DEFAULT NULL,
  `receipt_time` timestamp DEFAULT NULL,
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `check_quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `uk_sku_id_warehouse_id` UNIQUE (`sku_id`, `warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_inventory_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `sku_id` bigint NOT NULL,
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `before_quantity` decimal(20, 2) DEFAULT NULL,
  `after_quantity` decimal(20, 2) DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expiration_date` timestamp DEFAULT NULL,
  `price` decimal(16, 2) DEFAULT NULL,
  `total_price` decimal(16, 2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `order_no` varchar(64) DEFAULT NULL,
  `order_type` int DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `category_id` bigint NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_item_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_item_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL DEFAULT '0',
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort` int DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_item_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item_id` bigint NOT NULL,
  `bar_code` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `length` decimal(10, 1) DEFAULT NULL,
  `width` decimal(10, 1) DEFAULT NULL,
  `height` decimal(10, 1) DEFAULT NULL,
  `gross_weight` decimal(10, 3) DEFAULT NULL,
  `net_weight` decimal(10, 3) DEFAULT NULL,
  `cost_price` decimal(16, 2) DEFAULT NULL,
  `selling_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_merchant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `type` tinyint NOT NULL,
  `level` varchar(10) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `telephone` varchar(13) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_movement_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `source_warehouse_id` bigint NOT NULL,
  `target_warehouse_id` bigint NOT NULL,
  `total_quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_movement_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `source_warehouse_id` bigint NOT NULL,
  `target_warehouse_id` bigint NOT NULL,
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expiration_date` timestamp DEFAULT NULL,
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `price` decimal(16, 2) DEFAULT NULL,
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_receipt_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL,
  `type` int NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `biz_order_no` varchar(64) DEFAULT NULL,
  `merchant_id` bigint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_receipt_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `batch_no` varchar(64) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expiration_date` timestamp DEFAULT NULL,
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `price` decimal(16, 2) DEFAULT NULL,
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_shipment_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL,
  `type` int NOT NULL,
  `order_time` timestamp NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `biz_order_no` varchar(64) DEFAULT NULL,
  `merchant_id` bigint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `total_quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_shipment_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `area_id` bigint NOT NULL DEFAULT '0',
  `inventory_detail_id` bigint DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL,
  `production_date` timestamp DEFAULT NULL,
  `expiration_date` timestamp DEFAULT NULL,
  `quantity` decimal(20, 2) NOT NULL DEFAULT '0',
  `price` decimal(16, 2) DEFAULT NULL,
  `total_price` decimal(16, 2) DEFAULT NULL,
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Source: nomix-module-wms/src/test/resources/sql/create_tables.sql
CREATE TABLE IF NOT EXISTS `wms_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT '0',
  `creator` varchar(64) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater` varchar(64) DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` bit NOT NULL DEFAULT FALSE,
  `tenant_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
SET FOREIGN_KEY_CHECKS=1;
