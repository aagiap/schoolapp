package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "grades")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentId;
    private String semester;
    private String subject;
    private String teacherName;
    private String score15m;
    private String score45m;
    private Double scoreFinal;
    private Double scoreAvg;
}