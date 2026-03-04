package com.schoolapp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "notifications")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentId; // Nếu null là thông báo chung toàn trường
    private String type; // "HỌC TẬP", "SỰ KIỆN", "HỆ THỐNG"
    private String title;
    private String content;
    private LocalDateTime createdAt;
}