package com.schoolapp.controller;

import com.schoolapp.dto.AppDTOs;
import com.schoolapp.service.StudentDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/app")
@RequiredArgsConstructor
public class AppController {
    private final StudentDataService dataService;

    @GetMapping("/grades/{studentId}")
    public ResponseEntity<List<AppDTOs.GradeDTO>> getGrades(@PathVariable String studentId, @RequestParam String semester) {
        return ResponseEntity.ok(dataService.getGrades(studentId, semester));
    }

    @GetMapping("/schedules")
    public ResponseEntity<List<AppDTOs.ScheduleDTO>> getSchedules(@RequestParam String className, @RequestParam String week) {
        return ResponseEntity.ok(dataService.getSchedules(className, week));
    }

    @GetMapping("/exams/{studentId}")
    public ResponseEntity<List<AppDTOs.ExamDTO>> getExams(@PathVariable String studentId, @RequestParam String semester) {
        return ResponseEntity.ok(dataService.getExams(studentId, semester));
    }

    @GetMapping("/attendances/{studentId}")
    public ResponseEntity<AppDTOs.AttendanceSummaryDTO> getAttendances(@PathVariable String studentId) {
        return ResponseEntity.ok(dataService.getAttendanceSummary(studentId));
    }

    @GetMapping("/notifications/{studentId}")
    public ResponseEntity<List<AppDTOs.NotificationDTO>> getNotifications(@PathVariable String studentId) {
        return ResponseEntity.ok(dataService.getNotifications(studentId));
    }
}