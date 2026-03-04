package com.schoolapp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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
    @Column(unique = true, nullable = false, length = 15)
    private String phone;
    @Column(nullable = false)
    private String password;
    private String fullName;
    private String className;
    private LocalDate dob;
    private String email;
    private String academicYear;
    private String avatarUrl;
}