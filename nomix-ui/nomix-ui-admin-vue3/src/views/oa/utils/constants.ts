/** OA 考勤类型，与后端 OaAttendanceTypeEnum 保持一致。 */
export const OA_ATTENDANCE_TYPE = {
  CLOCK_IN: 1,
  CLOCK_OUT: 2,
  LEAVE: 3,
  TRAVEL: 4
} as const

/** OA 考勤状态，与后端 OaAttendanceStatusEnum 保持一致。 */
export const OA_ATTENDANCE_STATUS = {
  NORMAL: 1,
  LATE: 2,
  EARLY: 3,
  LEAVE: 4,
  TRAVEL: 5
} as const