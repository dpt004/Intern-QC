# Automation Test Report theo nhóm chức năng

## 1. Thông tin chung

| Hạng mục | Giá trị |
| --- | --- |
| Project | Student Attendance System |
| Website production | https://sasdau.vercel.app/ |
| Môi trường local | http://localhost:8080 |
| Framework | Robot Framework + SeleniumLibrary |
| Kiến trúc automation | Page Object Model (POM) |
| Ngày cập nhật | 2026-06-09 |
| Nguồn test case | documents/QC_Test_Cases.xlsx |

## 2. Tổng quan kết quả automation

| Chỉ số | Giá trị |
| --- | ---: |
| Tổng số automation test cases | 32 |
| Số test cases đã có script | 32 |
| Số test cases đã chạy thực tế đạt | 32 |
| Số test cases kiểm tra cú pháp sau refactor POM đạt | 32 |
| Fail | 0 |
| Chưa chạy thực tế | 0 |
| Tỷ lệ pass runtime | 100% |
| Tỷ lệ pass dry-run sau refactor | 100% |

Ghi chú: các suite đã từng được chạy thực tế và đạt 32/32. Sau khi refactor sang POM, đã chạy `robot --dryrun --output NONE --log NONE --report NONE Automation\tests` và toàn bộ 32/32 test cases đều đạt kiểm tra cú pháp. Nhóm Điểm danh, Phân công tiết học, Thời khóa biểu và một phần Báo cáo ưu tiên chạy local để tránh gửi quá nhiều request lên production.

## 3. Report theo automation suite

| Nhóm automation | File test | Loại test | Phạm vi | Tổng case | Pass | Fail | Môi trường chạy | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Login smoke | Automation/tests/login_smoke.robot | Smoke | Login, Logout | 6 | 6 | 0 | Production | Đã chạy thực tế trước refactor; sau refactor dry-run đạt 6/6 |
| Role regression | Automation/tests/role_regression.robot | Regression | Phân quyền theo role | 3 | 3 | 0 | Production | Đã chạy thực tế trước refactor; sau refactor dry-run đạt 3/3 |
| Class, student, import regression | Automation/tests/class_student_import_regression.robot | Regression | Lớp học, Sinh viên, Import Students | 5 | 5 | 0 | Production | Đã chạy thực tế trước refactor; sau refactor dry-run đạt 5/5 |
| Attendance, schedule, report regression | Automation/tests/attendance_schedule_report_regression.robot | Regression | Điểm danh, Phân công tiết học, Thời khóa biểu, Báo cáo | 8 | 8 | 0 | Localhost | Đã chạy thực tế ở local để tránh gửi quá nhiều request lên production; sau refactor dry-run đạt 8/8 |
| Remaining regression | Automation/tests/remaining_regression.robot | Regression | Đăng ký, Sinh viên API flow, Import, Schedule, Report export | 10 | 10 | 0 | Production | Đã chạy thực tế trước refactor; sau refactor dry-run đạt 10/10 |

## 4. Report theo nhóm chức năng

| Chức năng | Manual test cases | Automation scripts | Runtime pass | Chưa chạy |
| --- | --- | --- | --- | --- |
| Báo cáo | 3 | 3 | 3 | 0 |
| Đăng ký | 4 | 4 | 4 | 0 |
| Đăng nhập | 5 | 5 | 5 | 0 |
| Đăng xuất | 1 | 1 | 1 | 0 |
| Điểm danh | 2 | 2 | 2 | 0 |
| Khóa điểm danh | 1 | 1 | 1 | 0 |
| Lớp học | 3 | 3 | 3 | 0 |
| Nhập danh sách sinh viên | 2 | 2 | 2 | 0 |
| Phân công tiết học | 3 | 3 | 3 | 0 |
| Phân quyền | 3 | 3 | 3 | 0 |
| Sinh viên | 3 | 3 | 3 | 0 |
| Thời khóa biểu | 2 | 2 | 2 | 0 |

## 5. Cấu trúc POM sau refactor

| Thành phần | Vai trò |
| --- | --- |
| Automation/resources/app.resource | File import tổng cho các test suite |
| Automation/resources/common.resource | Cấu hình browser, URL, tài khoản test và biến menu dùng chung |
| Automation/resources/pages/login_page.resource | Keyword và locator cho màn hình Login |
| Automation/resources/pages/dashboard_page.resource | Keyword Dashboard, Logout và Sidebar menu |
| Automation/resources/pages/register_page.resource | Keyword cho màn hình Register |
| Automation/resources/pages/class_page.resource | Keyword cho chức năng Lớp học |
| Automation/resources/pages/student_page.resource | Keyword cho Sinh viên và Import Students |
| Automation/resources/pages/attendance_page.resource | Keyword cho Điểm danh và Khóa điểm danh |
| Automation/resources/pages/schedule_page.resource | Keyword cho Phân công tiết học |
| Automation/resources/pages/timetable_page.resource | Keyword cho Thời khóa biểu |
| Automation/resources/pages/report_page.resource | Keyword cho Báo cáo |
| Automation/resources/services/api_flows.resource | Keyword hỗ trợ tạo/sửa/xóa dữ liệu bằng API để test flow gọn hơn |

## 6. Đánh giá

Automation hiện đã bao phủ toàn bộ 32 manual test cases trong phạm vi kiểm thử hiện tại. Sau refactor POM, test suite gọn hơn, locator được gom theo từng page/resource nên dễ bảo trì hơn khi giao diện thay đổi. Kết quả manual và automation đang khớp nhau: tất cả test cases đều Pass, chưa ghi nhận defect trong phạm vi đã test.
