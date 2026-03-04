package com.schoolapp.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class AppDTOs {
    // Auth & Profile
    public record LoginRequest(String phone, String password) {}
    public record ResetPasswordRequest(String phone, String newPassword) {}
    public record StudentDTO(String studentId, String fullName, String className, String phone, String email, String academicYear, LocalDate dob) {}

    // Bảng điểm
    public record GradeDTO(String subject, String teacherName, String score15m, String score45m, Double scoreFinal, Double scoreAvg) {}

    // Thời khóa biểu
    public record ScheduleDTO(LocalDate studyDate, Integer period, String subject, String teacherName, String room, String timeRange) {}

    // Lịch thi
    public record ExamDTO(String subject, LocalDateTime examDateTime, String room, Integer durationMinutes) {}

    // Điểm danh (Gồm phần thống kê tổng và chi tiết từng ngày)
    public record AttendanceRecordDTO(LocalDate attendanceDate, String status, String note) {}
    public record AttendanceSummaryDTO(Integer totalDays, Integer presentDays, Integer absentDays, Double percentage, List<AttendanceRecordDTO> details) {}

    // Thông báo
    public record NotificationDTO(String type, String title, String content, LocalDateTime createdAt) {}
}
