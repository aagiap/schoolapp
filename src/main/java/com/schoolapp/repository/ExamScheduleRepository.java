package com.schoolapp.repository;

import com.schoolapp.entity.ExamSchedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamScheduleRepository extends JpaRepository<ExamSchedule, Long> {
    List<ExamSchedule> findByStudentIdAndSemesterOrderByExamDateTimeAsc(String studentId, String semester);
}