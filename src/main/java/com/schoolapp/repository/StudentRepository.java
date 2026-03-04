package com.schoolapp.repository;

import com.schoolapp.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StudentRepository extends JpaRepository<Student, String> {
    Optional<Student> findByPhone(String phone);
}