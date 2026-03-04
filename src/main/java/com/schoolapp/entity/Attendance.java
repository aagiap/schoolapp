package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "attendances")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attendance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentId;
    private LocalDate attendanceDate;
    private String status; // "Có mặt", "Vắng mặt", "Nghỉ có phép"
    private String note; // "Đúng giờ"
}
