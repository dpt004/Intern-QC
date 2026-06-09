*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Execute Auto Student Update Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const classPayload = {classCode:"AUTO_STU_" + suffix, className:"AUTO Student Class " + suffix};
    ...      const cls = await fetch("/api/classes", {method:"POST", headers, body:JSON.stringify(classPayload)}).then(r => r.json()).then(p => p.data || p);
    ...      const student = await fetch("/api/students", {method:"POST", headers, body:JSON.stringify({studentCode:"AUTO_STU_" + suffix, fullName:"Auto Student Before", className:classPayload.classCode})}).then(r => r.json()).then(p => p.data || p);
    ...      const updated = await fetch("/api/students/" + student.id, {method:"PUT", headers, body:JSON.stringify({studentCode:student.studentCode, fullName:"Auto Student After", className:classPayload.classCode})}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/students/" + student.id, {method:"DELETE", headers});
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers});
    ...      done(updated.fullName === "Auto Student After" ? "PASS" : "FAIL");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}

Execute Auto Student Delete Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const classPayload = {classCode:"AUTO_DEL_" + suffix, className:"AUTO Delete Class " + suffix};
    ...      const cls = await fetch("/api/classes", {method:"POST", headers, body:JSON.stringify(classPayload)}).then(r => r.json()).then(p => p.data || p);
    ...      const student = await fetch("/api/students", {method:"POST", headers, body:JSON.stringify({studentCode:"AUTO_DEL_" + suffix, fullName:"Auto Delete Student", className:classPayload.classCode})}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/students/" + student.id, {method:"DELETE", headers});
    ...      const list = await fetch("/api/students?className=" + encodeURIComponent(classPayload.classCode), {headers}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers});
    ...      done(Array.isArray(list) && list.length === 0 ? "PASS" : "FAIL");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}

Execute Auto Import Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Authorization":"Bearer " + session.token};
    ...      const jsonHeaders = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const classPayload = {classCode:"AUTO_IMP_" + suffix, className:"AUTO Import Class " + suffix};
    ...      const cls = await fetch("/api/classes", {method:"POST", headers:jsonHeaders, body:JSON.stringify(classPayload)}).then(r => r.json()).then(p => p.data || p);
    ...      const csv = "studentCode,fullName\\nAUTO_IMP_STU_" + suffix + ",Auto Import Student";
    ...      const form = new FormData();
    ...      form.append("className", classPayload.classCode);
    ...      form.append("file", new File([csv], "auto-import.csv", {type:"text/csv"}));
    ...      const imported = await fetch("/api/students/import", {method:"POST", headers, body:form}).then(r => r.json()).then(p => p.data || p);
    ...      const students = await fetch("/api/students?className=" + encodeURIComponent(classPayload.classCode), {headers:jsonHeaders}).then(r => r.json()).then(p => p.data || p);
    ...      for (const student of students) { await fetch("/api/students/" + student.id, {method:"DELETE", headers:jsonHeaders}); }
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers:jsonHeaders});
    ...      done(imported.imported >= 1 ? "PASS" : "FAIL");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}

Execute Auto Schedule Update Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const cls = await fetch("/api/classes", {method:"POST", headers, body:JSON.stringify({classCode:"AUTO_SCH_" + suffix, className:"AUTO Schedule Class " + suffix})}).then(r => r.json()).then(p => p.data || p);
    ...      const teachers = await fetch("/api/schedules/teachers", {headers}).then(r => r.json()).then(p => p.data || p);
    ...      const teacher = teachers[0];
    ...      const schedule = await fetch("/api/schedules", {method:"POST", headers, body:JSON.stringify({classId:cls.id, teacherId:teacher.id, dayOfWeek:7, startTime:"21:00", endTime:"21:30", room:"AUTO1", subjectName:"AUTO Before"})}).then(r => r.json()).then(p => p.data || p);
    ...      const updated = await fetch("/api/schedules/" + schedule.id, {method:"PUT", headers, body:JSON.stringify({classId:cls.id, teacherId:teacher.id, dayOfWeek:7, startTime:"21:30", endTime:"22:00", room:"AUTO2", subjectName:"AUTO After"})}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/schedules/" + schedule.id, {method:"DELETE", headers});
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers});
    ...      done(updated.subjectName === "AUTO After" ? "PASS" : "FAIL");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}

Execute Auto Schedule Delete Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const cls = await fetch("/api/classes", {method:"POST", headers, body:JSON.stringify({classCode:"AUTO_SDEL_" + suffix, className:"AUTO Schedule Delete " + suffix})}).then(r => r.json()).then(p => p.data || p);
    ...      const teacher = (await fetch("/api/schedules/teachers", {headers}).then(r => r.json()).then(p => p.data || p))[0];
    ...      const schedule = await fetch("/api/schedules", {method:"POST", headers, body:JSON.stringify({classId:cls.id, teacherId:teacher.id, dayOfWeek:7, startTime:"22:00", endTime:"22:30", room:"AUTO3", subjectName:"AUTO Delete"})}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/schedules/" + schedule.id, {method:"DELETE", headers});
    ...      const schedules = await fetch("/api/schedules", {headers}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers});
    ...      done(schedules.some(s => s.id === schedule.id) ? "FAIL" : "PASS");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}

Execute Auto Report Export Flow
    ${result}=    Execute Async Javascript
    ...    const done = arguments[arguments.length - 1];
    ...    (async () => {
    ...      const session = JSON.parse(localStorage.getItem("attendance.session"));
    ...      const headers = {"Content-Type":"application/json", "Authorization":"Bearer " + session.token};
    ...      const suffix = Date.now();
    ...      const classCode = "AUTO_RPT_" + suffix;
    ...      const cls = await fetch("/api/classes", {method:"POST", headers, body:JSON.stringify({classCode, className:"AUTO Report Class " + suffix})}).then(r => r.json()).then(p => p.data || p);
    ...      const student = await fetch("/api/students", {method:"POST", headers, body:JSON.stringify({studentCode:"AUTO_RPT_STU_" + suffix, fullName:"Auto Report Student", className:classCode})}).then(r => r.json()).then(p => p.data || p);
    ...      await fetch("/api/attendance", {method:"POST", headers, body:JSON.stringify({date:"2026-06-05", className:classCode, records:[{studentId:student.id, status:"present", absenceReason:"", isExcused:false}]})});
    ...      const csv = await fetch("/api/reports/attendance.csv?from=2026-06-05&to=2026-06-05&className=" + encodeURIComponent(classCode), {headers}).then(r => r.text());
    ...      await fetch("/api/students/" + student.id, {method:"DELETE", headers});
    ...      await fetch("/api/classes/" + cls.id, {method:"DELETE", headers});
    ...      done(csv.includes("AUTO_RPT_STU_") && csv.includes("Auto Report Student") ? "PASS" : "FAIL");
    ...    })().catch(e => done("FAIL:" + e.message));
    RETURN    ${result}
