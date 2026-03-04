package com.schoolapp.repository;

import com.schoolapp.entity.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
    List<Schedule> findByClassNameAndWeekNameOrderByStudyDateAscPeriodAsc(String className, String weekName);
}