# Intern QC Documents

Repo này dùng để đồng bộ tài liệu thực tập QC giữa nhiều máy.

## Tài liệu

- `documents/QC_Test_Plan_Test_Cases_Template.docx`: template Word cho Test Plan, Bug Report và Test Summary.
- `documents/QC_Test_Cases_Template.xlsx`: template Excel ban đầu cho Test Scenarios/Test Cases.
- `documents/QC_Test_Cases_Template_SAFE.xlsx`: bản Excel an toàn hơn, ưu tiên dùng nếu file ban đầu bị lỗi khi mở.

## Cách làm việc trên máy khác

```powershell
git clone https://github.com/dpt004/Intern-QC.git
cd Intern-QC
```

Trước khi làm tiếp:

```powershell
git pull
```

Sau khi cập nhật tài liệu:

```powershell
git add .
git commit -m "Update QC documents"
git push
```
