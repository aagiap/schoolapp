package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "schedules")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String className;
    private String weekName; // VD: "Tuần 12"
    private LocalDate studyDate; // VD: 2026-03-18
    private Integer period; // Tiết 1, 2, 3...
    private String subject;
    private String teacherName;
    private String room;
    private String timeRange; // "07:30 - 08:15"
}
