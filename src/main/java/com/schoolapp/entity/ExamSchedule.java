package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "exam_schedules")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExamSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentId;
    private String semester;
    private String subject;
    private LocalDateTime examDateTime; // Ngày và giờ thi
    private String room;
    private Integer durationMinutes; // 90, 120...
}
