# So sanh ket qua kiem thu thu cong va kiem thu tu dong

**Ngon ngu su dung:** Bao cao su dung tieng Viet khong dau de tranh loi encoding khi mo tren nhieu may. Chi giu lai ma test case va duong dan file vi do la dinh danh ky thuat.

## Tong quan

| Chi so | Gia tri |
| --- | ---: |
| Tong so test case kiem thu thu cong | 32 |
| So test case thu cong dat | 32 |
| So test case da co kiem thu tu dong | 32 |
| So test case dat buoc kiem tra cu phap | 32 |
| So test case chay that dat | 32 |
| So test case chua chay that | 0 |
| Ty le bao phu bang kiem thu tu dong | 100% |
| Ty le da xac nhan bang chay that | 100% |

Ghi chu: 24 test case da chay tren production theo tung nhom nho; 8 test case lien quan diem danh, thoi khoa bieu va bao cao da chay tren local tai http://localhost:8080 de tranh gui qua nhieu request vao website production.

## Bao phu theo chuc nang

| Chuc nang | So test case thu cong | Da co kiem thu tu dong | Chay that dat | Chua chay that |
| --- | ---: | ---: | ---: | ---: |
| Bao cao | 3 | 3 | 3 | 0 |
| Dang ky | 4 | 4 | 4 | 0 |
| Dang nhap | 5 | 5 | 5 | 0 |
| Dang xuat | 1 | 1 | 1 | 0 |
| Diem danh | 2 | 2 | 2 | 0 |
| Khoa diem danh | 1 | 1 | 1 | 0 |
| Lop hoc | 3 | 3 | 3 | 0 |
| Nhap danh sach sinh vien | 2 | 2 | 2 | 0 |
| Phan cong tiet hoc | 3 | 3 | 3 | 0 |
| Phan quyen | 3 | 3 | 3 | 0 |
| Sinh vien | 3 | 3 | 3 | 0 |
| Thoi khoa bieu | 2 | 2 | 2 | 0 |

## Bang doi chieu chi tiet

| Ma test case | Chuc nang | Do uu tien | Ket qua thu cong | Trang thai kiem thu tu dong | Kiem tra cu phap | Chay that | Moi truong chay | Nhan xet so sanh | File kiem thu tu dong |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TC_LOGIN_001 | Dang nhap | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_LOGIN_002 | Dang nhap | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_LOGIN_003 | Dang nhap | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_LOGIN_004 | Dang nhap | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_LOGIN_005 | Dang nhap | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_LOGOUT_001 | Dang xuat | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - login_smoke | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/login_smoke.robot |
| TC_ROLE_001 | Phan quyen | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - role_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/role_regression.robot |
| TC_ROLE_002 | Phan quyen | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - role_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/role_regression.robot |
| TC_ROLE_003 | Phan quyen | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - role_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/role_regression.robot |
| TC_CLASS_001 | Lop hoc | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - class_student_import_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/class_student_import_regression.robot |
| TC_CLASS_002 | Lop hoc | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - class_student_import_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/class_student_import_regression.robot |
| TC_CLASS_003 | Lop hoc | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - class_student_import_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/class_student_import_regression.robot |
| TC_STUDENT_001 | Sinh vien | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Production - class_student_import_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/class_student_import_regression.robot |
| TC_STUDENT_002 | Sinh vien | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_STUDENT_003 | Sinh vien | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_IMPORT_001 | Nhap danh sach sinh vien | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_IMPORT_002 | Nhap danh sach sinh vien | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - class_student_import_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/class_student_import_regression.robot |
| TC_ATT_001 | Diem danh | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_ATT_002 | Diem danh | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_ATT_LOCK_001 | Khoa diem danh | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_REGISTER_001 | Dang ky | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_REGISTER_002 | Dang ky | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_REGISTER_003 | Dang ky | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_REGISTER_004 | Dang ky | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_SCHEDULE_001 | Phan cong tiet hoc | Cao | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_SCHEDULE_002 | Phan cong tiet hoc | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_SCHEDULE_003 | Phan cong tiet hoc | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
| TC_TIMETABLE_001 | Thoi khoa bieu | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_TIMETABLE_002 | Thoi khoa bieu | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_REPORT_001 | Bao cao | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_REPORT_002 | Bao cao | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Localhost - attendance_schedule_report_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/attendance_schedule_report_regression.robot |
| TC_REPORT_003 | Bao cao | Trung binh | Dat | Da co kiem thu tu dong | Dat | Dat | Production - remaining_regression | Ket qua thu cong dat va kiem thu tu dong chay that dat | Automation/tests/remaining_regression.robot |
