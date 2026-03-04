package com.schoolapp.repository;

import com.schoolapp.entity.Grade;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GradeRepository extends JpaRepository<Grade, Long> {
    List<Grade> findByStudentIdAndSemester(String studentId, String semester);
}