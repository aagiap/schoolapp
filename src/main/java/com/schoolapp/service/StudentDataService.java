package com.schoolapp.service;

import com.schoolapp.dto.AppDTOs;
import com.schoolapp.entity.Attendance;
import com.schoolapp.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class StudentDataService {
    private final GradeRepository gradeRepo;
    private final ScheduleRepository scheduleRepo;
    private final ExamScheduleRepository examRepo;
    private final AttendanceRepository attendanceRepo;
    private final NotificationRepository notifRepo;

    public String checkdb() {
        notifRepo.count();
        return "Database connection is working!";
    }

    public List<AppDTOs.GradeDTO> getGrades(String studentId, String semester) {
        return gradeRepo.findByStudentIdAndSemester(studentId, semester).stream()
                .map(g -> new AppDTOs.GradeDTO(g.getSubject(), g.getTeacherName(), g.getScore15m(), g.getScore45m(), g.getScoreFinal(), g.getScoreAvg()))
                .collect(Collectors.toList());
    }

    public List<AppDTOs.ScheduleDTO> getSchedules(String className, String weekName) {
        return scheduleRepo.findByClassNameAndWeekNameOrderByStudyDateAscPeriodAsc(className, weekName).stream()
                .map(s -> new AppDTOs.ScheduleDTO(s.getStudyDate(), s.getPeriod(), s.getSubject(), s.getTeacherName(), s.getRoom(), s.getTimeRange()))
                .collect(Collectors.toList());
    }

    public List<AppDTOs.ExamDTO> getExams(String studentId, String semester) {
        return examRepo.findByStudentIdAndSemesterOrderByExamDateTimeAsc(studentId, semester).stream()
                .map(e -> new AppDTOs.ExamDTO(e.getSubject(), e.getExamDateTime(), e.getRoom(), e.getDurationMinutes()))
                .collect(Collectors.toList());
    }

    public AppDTOs.AttendanceSummaryDTO getAttendanceSummary(String studentId) {
        List<Attendance> list = attendanceRepo.findByStudentIdOrderByAttendanceDateDesc(studentId);
        int total = list.size();
        int present = (int) list.stream().filter(a -> "Có mặt".equals(a.getStatus())).count();
        int absent = total - present;
        double percentage = total == 0 ? 0 : Math.round(((double) present / total) * 100);

        List<AppDTOs.AttendanceRecordDTO> details = list.stream()
                .map(a -> new AppDTOs.AttendanceRecordDTO(a.getAttendanceDate(), a.getStatus(), a.getNote()))
                .collect(Collectors.toList());

        return new AppDTOs.AttendanceSummaryDTO(total, present, absent, percentage, details);
    }

    public List<AppDTOs.NotificationDTO> getNotifications(String studentId) {
        return notifRepo.findByStudentIdOrStudentIdIsNullOrderByCreatedAtDesc(studentId).stream()
                .map(n -> new AppDTOs.NotificationDTO(n.getType(), n.getTitle(), n.getContent(), n.getCreatedAt()))
                .collect(Collectors.toList());
    }
}