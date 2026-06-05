# Manual Test Report - Student Attendance System

## 1. Thong Tin Chung

| Hang muc | Gia tri |
| --- | --- |
| Project | Student Attendance System |
| Website | https://sasdau.vercel.app/ |
| Loai test | Manual functional testing |
| Ngay bao cao | 2026-06-05 |
| Nguon du lieu | `documents/QC_Test_Cases.xlsx` |

## 2. Pham Vi Test

Manual testing da bao phu cac nhom chuc nang chinh:

| Function | So luong test cases |
| --- | ---: |
| Login | 5 |
| Logout | 1 |
| Authorization | 3 |
| Classes | 3 |
| Students | 3 |
| Import Students | 2 |
| Attendance | 2 |
| Attendance Lock | 1 |
| Register | 4 |
| Schedule Assignment | 3 |
| Timetable | 2 |
| Reports | 3 |

## 3. Tong Ket Ket Qua

| Metric | Value |
| --- | ---: |
| Total Test Cases | 32 |
| Pass | 32 |
| Fail | 0 |
| Blocked | 0 |
| Not Run | 0 |
| Pass Rate | 100% |

## 4. Ket Qua Theo Priority

| Priority | So luong |
| --- | ---: |
| High | 12 |
| Medium | 20 |

## 5. Defect Summary

| Metric | Value |
| --- | ---: |
| Total Bugs Logged | 0 |
| Open Bugs | 0 |
| Critical/Major Bugs | 0 |

Khong co bug duoc ghi nhan trong file manual test case tai thoi diem lap report.

## 6. Danh Gia

Ket qua manual testing hien tai dat yeu cau cho vong test dau tien:

- Cac luong chinh cua he thong deu co test case va da duoc execute.
- 100% test cases dang o trang thai Pass.
- Chua phat hien defect can log bug report.
- Bo test case manual da san sang lam dau vao cho giai doan automation.

## 7. Next Steps

Chuyen dan sang automation theo thu tu uu tien:

| Nhom automation | Pham vi | Muc tieu |
| --- | --- | --- |
| Login smoke | Login, Logout | Tao smoke test co ban de kiem tra he thong con truy cap va dang nhap duoc |
| Role regression | Authorization | Kiem tra menu/chuc nang hien thi theo role admin, teacher, student |
| Class, student, import regression | Register, Students, Classes | Tu dong hoa cac flow CRUD it phu thuoc du lieu |
| Attendance, schedule, report regression | Attendance, Reports, Schedule | Tu dong hoa regression cho cac nghiep vu chinh |

Automation se duoc dat trong thu muc `Automation/` cua repo `Intern-QC`.
