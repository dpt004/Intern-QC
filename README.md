# Intern QC

Repo nay dung de luu tai lieu kiem thu thu cong va kiem thu tu dong cho du an Student Attendance System.

## Cau truc thu muc

```text
Intern-QC/
|-- Automation/
|   |-- resources/
|   |   |-- app.resource       # File import tong cho automation
|   |   |-- common.resource    # Cau hinh, tai khoan test va bien dung chung
|   |   |-- pages/             # Keyword theo Page Object Model
|   |   `-- services/          # Keyword ho tro API/test data flow
|   |-- tests/                 # Cac suite kiem thu tu dong
|   `-- results/               # Ket qua chay Robot Framework
`-- documents/                 # Tat ca tai lieu va bao cao kiem thu
```

## Tai lieu chinh

- `documents/QC_Test_Cases.xlsx`: test cases manual.
- `documents/Test_Report_Manual.md`: bao cao manual test.
- `documents/Test_Report_Manual.xlsx`: ban Excel cua bao cao manual test.
- `documents/Automation_Manual_Comparison.md`: bao cao so sanh manual va automation.
- `documents/Automation_Manual_Comparison.xlsx`: ban Excel cua bao cao so sanh.

## Automation suites

- `Automation/tests/login_smoke.robot`
- `Automation/tests/role_regression.robot`
- `Automation/tests/class_student_import_regression.robot`
- `Automation/tests/attendance_schedule_report_regression.robot`
- `Automation/tests/remaining_regression.robot`

## Cau truc POM

- `Automation/resources/app.resource`: import tat ca resource can cho test suite.
- `Automation/resources/common.resource`: luu cau hinh browser, URL, tai khoan test va ten menu dung chung.
- `Automation/resources/pages/`: moi file dai dien cho mot man hinh/chuc nang, vi du login, dashboard, class, student, attendance, schedule, timetable, report.
- `Automation/resources/services/api_flows.resource`: gom cac keyword tao/sua/xoa du lieu bang API de test suite gon va de bao tri.
- `Automation/tests/`: chi giu test flow va assertion muc nghiep vu, khong dat locator truc tiep trong suite neu co the dua vao page resource.

## Lenh chay automation

Chay kiem tra cu phap:

```powershell
robot --dryrun --output NONE --log NONE --report NONE Automation\tests
```

Chay theo tung nhom tren production:

```powershell
robot -d Automation\results\login_smoke Automation\tests\login_smoke.robot
robot -d Automation\results\role_regression Automation\tests\role_regression.robot
robot -d Automation\results\class_student_import Automation\tests\class_student_import_regression.robot
robot -d Automation\results\remaining Automation\tests\remaining_regression.robot
```

Chay nhom diem danh, thoi khoa bieu va bao cao tren local:

```powershell
robot -d Automation\results\attendance_schedule_report_local -v BASE_URL:http://localhost:8080 Automation\tests\attendance_schedule_report_regression.robot
```

## Ket qua hien tai

- Manual test: 32/32 dat.
- Automation dry-run: 32/32 dat.
- Automation runtime: 32/32 dat.

Ghi chu: cac tai lieu va bao cao nam trong `documents/`. Thu muc `Automation/` chi giu script automation, keyword dung chung va ket qua chay test.
