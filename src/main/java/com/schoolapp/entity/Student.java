package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "students")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Student {
    @Id
    @Column(name = "student_id", length = 20)
    private String studentId;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String fullName;
    private String className;
    private LocalDate dob;
    private String email;
    private String academicYear;
    private String avatarUrl;
}